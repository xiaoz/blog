var async = require('async');
var check = require('validator').check;
var sanitize = require('validator').sanitize;
var common = require('../common/common.js');
var memssage_ctrl = require('../message/message.js');
var Util = require('../../lib/util.js');
var log = require('../../lib/log.js');
var productDao = require('../../dao/product.js');
var userDao = require('../../dao/user.js');
var categoryDao = require('../../dao/product_categorys.js');
var replyDao = require('../../dao/reply.js');
var productCategoryDao = require('../../dao/product_category.js');

/**
 * 查看某篇产品
 */
exports.viewArticle = function(req, res, next) {
    var product_id = req.params.product_id;
    var author_id;
    async.auto({
        product : function(cb) {
            productDao.queryArticle(product_id, function(err, product) {
                if (err || !product) {
                    res.render('notify/notify', {
                    	current	: 'product',
            			active	: 'user_index',
                        error : '您查找的产品信息存在错误,该产品可能已被删除'
                    });
                    return;
                }
                else {
                    author_id = product.author_id;
                    cb(null, product);
                }
            });
        },
        author : [ 'product', function(cb) {
            userDao.queryUser(author_id, function(err, user) {
                if (err || !user) {
                    cb(null, {});
                }
                else {
                    cb(null, user);
                }
            });
        } ],
        updateArticle : [ 'product', function(cb) {
            productDao.updateVisitCountOfArticle(product_id, function(err, info) {
                cb(null, null);
            });
        } ],
        product_categories : function(cb) {
            categoryDao.queryCategoriesOfProduct(product_id, function(err, categories) {
                if (err || !categories) {
                    cb(null, []);
                }
                else {
                    cb(null, categories);
                }
            });
        },
        product_replies : function(cb) {// 该篇产品的回复
            replyDao.queryRepliesOfProduct(product_id, function(err, replies) {
                if (err || !replies) {
                    cb(null, []);
                }
                else {
                    async.map(replies, function(reply_item, callback) {// 为回复查找其author信息
                        userDao.queryUser(reply_item.author_id, function(err, user) {
                            reply_item.friendly_create_at = Util.format_date(reply_item.create_at, true);
                            reply_item.author = user || {};
                            callback(null, reply_item);
                        });
                    }, function(err, article_replies) {
                    	
                    	var replies2 = [];
            			for(var i = article_replies.length-1; i>=0; i--){
            				if(article_replies[i].reply_id){
            					replies2.push(article_replies[i]);	
            					article_replies.splice(i,1);
            				}
            			}
            			for(var j=0; j<article_replies.length; j++){
            				article_replies[j].replies = [];
            				for(var k=0; k<replies2.length; k++){
            					var id1 = replies[j].id;
            					var id2 = replies2[k].reply_id;
            					if(id1.toString() == id2.toString()){
            						article_replies[j].replies.push(replies2[k]);	
            					}	
            				}
            				article_replies[j].replies.reverse();
            			}
                    	
                        cb(null, article_replies);
                    });
                }
            });
        }
    }, function(err, results) {
        if (err) {
            res.render('notify/notify', {
            	current	: 'product',
    			active	: 'user_index',
                error : '您查找的产品信息存在错误'
            });
            return;
        }
        results.product.replies = results.product_replies;
        res.render('product/product', {
        	current	: 'product',
			active	: 'user_index',
            author : results.author,
            product : results.product,
            product_categories : results.product_categories
        });
        return;
    });
};

/**
 * 点击编辑产品
 */
exports.editArticle = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
            error : '未登录用户不能编辑产品'
        });
        return;
    }
    var product_id = req.params.product_id;
    var author_id;
    async.auto({
        product : function(cb) {
            productDao.queryArticle(product_id, function(err, product) {
                if (err || !product) {
                    cb(null, {});
                }
                else {
                    author_id = product.author_id;
                    if (author_id != req.session.user.id) {
                        res.render('notify/notify', {
                        	current	: 'product',
                			active	: 'user_index',
                            error : '您不具备编辑该产品的权限'
                        });
                        return;
                    }
                    cb(null, product);
                }
            });
        },
        all_categories : [ 'product', function(cb) {
            categoryDao.queryCategoriesOfUser(author_id, function(err, categories) {
                if (err || !categories) {
                    cb(null, []);
                }
                else {
                    cb(null, categories);
                }
            });
        } ],
        product_categories : function(cb) {
            categoryDao.queryCategoriesOfProduct(product_id, function(err, product_categories) {
                if (err || !product_categories) {
                    cb(null, []);
                }
                else {
                    cb(null, product_categories);
                }
            });
        }
    }, function(err, results) {
        if (err) {
            res.render('notify/notify', {
            	current	: 'product',
    			active	: 'user_index',
                error : '您要编辑的产品信息存在错误'
            });
            return;
        }

        for ( var i = 0; results.all_categories.length && i < results.all_categories.length; i++) {
            for ( var j = 0; j < results.product_categories.length; j++) {
                if (results.product_categories[j].id == results.all_categories[i].id) {
                    results.all_categories[i].is_selected = true;
                }
            }
        }

        res.render('product/edit', {
        	current	: 'product',
			active	: 'user_index',
            product : results.product,
            categories : results.all_categories,
            user_id :req.session.user.id
        });
        return;
    });
};

/**
 * 更改产品
 */
exports.modifyArticle = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
            error : '未登录用户不能修改产品'
        });
        return;
    }
    var product_id = req.params.product_id;
    var title = sanitize(req.body.title).trim();
    title = sanitize(title).xss();
    var content = req.body.content;
    var goods_img = req.body.goods_img;
    var product_categories = [];
    if (req.body.product_categories != '') {
        product_categories = req.body.product_categories.split(',');
    }
    var updateDate = Util.format_date(new Date());

    async.auto({
        updateArticle : function(cb) {// 更新产品基本信息
            productDao.updateArticle(title, content, updateDate, goods_img,product_id, function(err, info) {
                if (err) {
                    res.render('notify/notify', {
                        error : '修改产品发生错误'
                    });
                    return;
                }
                userDao.queryAllFollowers(req.session.user.id, function(err, users) {// 给粉丝发送消息
                    async.forEach(users, function(user, callback) {
                        var mbody = {};
                        mbody.from_user_id = req.session.user.id;
                        mbody.from_user_name = req.session.user.loginname;
                        mbody.product_id = product_id;
                        mbody.product_title = title;
                        memssage_ctrl.create_message(common.MessageType.update_product, user.id, JSON.stringify(mbody), function() {
                            callback();
                        });
                    }, function(err) {
                        cb(null, '');
                    });
                });
            });
        },
        deleteCategoriesOfProduct : [ 'updateArticle', function(cb) {// 删除旧的产品分类
            productCategoryDao.deleteCategoriesOfProduct(product_id, function(err, info) {
                if (err) {
                    log.error('删除产品旧分类发生异常,productId:' + product_id);
                }
                cb(null, '');
            });
        } ],
        saveCategoriesOfArticle : [ 'deleteCategoriesOfProduct', function(cb) {// 插入新的产品分类
            categoryDao.saveCategoriesOfArticle(product_id, product_categories, function(err, categories) {
                if (err) {
                    log.error('修改产品：插入新的产品分类出现错误[' + product_id + ',' + product_categories + ']');
                }
                cb(null, '');
            });
        } ],
    }, function(err, results) {
        if (err) {
            res.render('notify/notify', {
            	current	: 'product',
    			active	: 'user_index',
                error : '修改产品时发生错误'
            });
            return;
        }
        res.redirect('/product/' + product_id);
    });
};

/**
 * 删除产品
 * 
 * @param req
 * @param res
 * @param next
 */
exports.deleteArticle = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
            error : '未登录用户不能删除产品'
        });
        return;
    }
    productDao.deleteArticle(req.params.product_id, req.session.user.id, function(err, info) {
        if (err) {
            res.render('notify/notify', {
            	current	: 'product',
    			active	: 'user_index',
                error : '删除产品出错,请检查您是否为该产品作者或者操作是否出错'
            });
            return;
        }
        productCategoryDao.deleteCategoriesOfProduct(req.params.product_id, function(err, info) {
            if (err) {
                res.render('notify/notify', {
                	current	: 'product',
        			active	: 'user_index',
                    error : '从产品分类中删除这篇产品出错'
                });
                return;
            }

            replyDao.deleteRepliesOfArticle(req.params.product_id, function(err, info) {
                if (err) {
                    res.render('notify/notify', {
                    	current	: 'product',
            			active	: 'user_index',
                        error : '删除这篇产品的回复出错'
                    });
                    return;
                }
                res.render('notify/notify', {
                	current	: 'product',
        			active	: 'user_index',
                    success : '删除产品成功'
                });
                return;
            });
        });
    });
};

/**
 * 查看用户的产品[不按分类]
 */
exports.viewArticlesOfUser = function(req, res, next) {
    var user_id = req.params.user_id;
	
	var page  = Number(req.query.page) || 1;
	var page_size = Number(req.query.page_size) || 6;
	var start = (page - 1)*page_size;
		async.auto({
	        products : function(cb) {
				productDao.queryArticlesOfUser(user_id,start,page_size, function(err, products) {
					if (err) {
	                    cb(null, []);
	                }
	                if (!products) {
	                    cb(null, []);
	                }
	                cb(null, products);
				})
	        },
	        pages : function(cb) {
	           productDao.queryArticlesOfUserTotal(user_id, function(err, total) {
					if (err) {
	                    cb(null, []);
	                }
	                if (!total) {
	                    cb(null, 0);
	                }
					var nums = Math.ceil(total[0].total/page_size);
	                cb(null, nums);
				})
	        },
	      
	    }, function(err, results) {
	        if (err) {
	        	 res.render('notify/notify', {
	        		current	: 'product',
	     			active	: 'user_index',
                	error : '查找用户的所有产品出错'
            	});
            	return;
	        }
			res.render('product/user_products', {
			current	: 'product',
			active	: 'user_index',
            user_id : user_id,
            products : results.products,
			pages : results.pages,
			current_page :page
        	});
        return;
	    });
	
     
};

/**
 * 查看用户某分类下产品
 */
exports.viewArticlesOfUserCategory = function(req, res, next) {
    var category_id = req.params.category_id;
    var user_id = req.params.user_id;
    var page  = Number(req.query.page) || 1;
	var page_size = Number(req.query.page_size) || 6;
	var start = (page - 1)*page_size;
	async.auto({
        products : function(cb) {
			 productDao.queryArticlesOfUserCategory(user_id, category_id,start,page_size, function(err, products) {
		        if (err) {
		            res.render('notify/notify', {
		            	current	: 'product',
		    			active	: 'user_index',
		                error : '查找分类下产品出错'
		            });
		            return;
		        }
		        
		        cb(null, products);
			 })
        },
        pages : function(cb) {
           productDao.queryArticlesOfUserCategoryTotal(user_id,category_id, function(err, total) {
				if (err) {
                    cb(null, []);
                }
                if (!total) {
                    cb(null, 0);
                }
				var nums = Math.ceil(total[0].total/page_size);
                cb(null, nums);
			})
        },
      
    }, function(err, results) {
        if (err) {
        	 res.render('notify/notify', {
        		 current	: 'product',
     			 active	: 'user_index',
                 error : '查找分类下产品出错'
             });
        	return;
        }
        categoryDao.queryCategory(category_id, function(err, category) {
            res.render('product/products', {
            	current	: 'product',
    			active	: 'user_index',
                user_id : user_id,
                products : results.products,
                current_page :page,
                pages : results.pages,
                category : category || {}
            });
            return;
        });
        
    });
};

/**
 * 发布新产品
 */
exports.createArticle = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
            error : '未登录用户不能发布产品'
        });
        return;
    }

    var method = req.method.toLowerCase();

    if (method == 'get') {// 点击"发布"按钮
        categoryDao.queryCategoriesOfUser(req.session.user.id, function(err, categories) {
            if (err) {
                res.render('notify/notify', {
                    error : '获取所有分类出错'
                });
                return;
            }
            res.render('product/create', {
            	current	: 'product',
    			active	: 'user_index',
                categories : categories
            });
            return;
        });
    }

    if (method == 'post') {
        var title = sanitize(req.body.title).trim();
        title = sanitize(title).xss();
        var content = req.body.content;// 要配置editor_config.js的textarea才会生效
        var goods_img = req.body.goods_img;
        var product_categories = [];
        if (req.body.product_categories != '') {
            product_categories = req.body.product_categories.split(',');
        }

        var insertDate = Util.format_date(new Date());
        productDao.saveArticle(title, content, req.session.user.id, insertDate,goods_img, function(err ,info){
            if (err) {
                res.render('notify/notify', {
                	current	: 'product',
        			active	: 'user_index',
                    error : '保存产品时发生错误'
                });
                return;
            }

            categoryDao.saveCategoriesOfArticle(info.insertId,product_categories, function(err, categories){
                if (err) {
                    res.render('notify/notify', {
                    	current	: 'product',
            			active	: 'user_index',
                        error : '保存产品分类时发生错误'
                    });
                    return;
                }
                else {
                    userDao.queryAllFollowers(req.session.user.id, function(err, users) {// 给粉丝发送消息
                        async.forEach(users, function(user, callback) {
                            var mbody = {};
                            mbody.from_user_id = req.session.user.id;
                            mbody.from_user_name = req.session.user.loginname;
                            mbody.product_id = info.insertId;
                            mbody._title = title;
                            memssage_ctrl.create_message(common.MessageType.create_product, user.id, JSON.stringify(mbody), function() {
                                callback();
                            });
                        }, function(err) {
                            res.redirect('/product/' + info.insertId);
                        });
                    });
                }
            });         
        });
    }
};
