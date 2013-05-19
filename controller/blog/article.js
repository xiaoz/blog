var async = require('async');
var check = require('validator').check;
var sanitize = require('validator').sanitize;
var common = require('../common/common.js');
var memssage_ctrl = require('../message/message.js');
var Util = require('../../lib/util.js');
var log = require('../../lib/log.js');
var articleDao = require('../../dao/article.js');
var userDao = require('../../dao/user.js');
var categoryDao = require('../../dao/category.js');
var replyDao = require('../../dao/reply.js');
var articleCategoryDao = require('../../dao/article_category.js');

/**
 * 查看某篇文章
 */
exports.viewArticle = function(req, res, next) {
    var article_id = req.params.article_id;
    var author_id;
    async.auto({
        article : function(cb) {
            articleDao.queryArticle(article_id, function(err, article) {
                if (err || !article) {
                    res.render('notify/notify', {
                    	current	: 'blog',
            			active	: 'user_index',
                        error : '您查找的文章信息存在错误,该文章可能已被删除'
                    });
                    return;
                }
                else {
                    author_id = article.author_id;
                    cb(null, article);
                }
            });
        },
        author : [ 'article', function(cb) {
            userDao.queryUser(author_id, function(err, user) {
                if (err || !user) {
                    cb(null, {});
                }
                else {
                    cb(null, user);
                }
            });
        } ],
        updateArticle : [ 'article', function(cb) {
            articleDao.updateVisitCountOfArticle(article_id, function(err, info) {
                cb(null, null);
            });
        } ],
        article_categories : function(cb) {
            categoryDao.queryCategoriesOfArticle(article_id, function(err, categories) {
                if (err || !categories) {
                    cb(null, []);
                }
                else {
                    cb(null, categories);
                }
            });
        },
        article_replies : function(cb) {// 该篇文章的回复
            replyDao.queryRepliesOfArticle(article_id, function(err, replies) {
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
            	current	: 'blog',
    			active	: 'user_index',
                error : '您查找的文章信息存在错误'
            });
            return;
        }
        results.article.replies = results.article_replies;
        res.render('article/article', {
        	current	: 'blog',
			active	: 'user_index',
            author : results.author,
            article : results.article,
            article_categories : results.article_categories
        });
        return;
    });
};

/**
 * 点击编辑文章
 */
exports.editArticle = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
            error : '未登录用户不能编辑文章'
        });
        return;
    }
    var article_id = req.params.article_id;
    var author_id;
    async.auto({
        article : function(cb) {
            articleDao.queryArticle(article_id, function(err, article) {
                if (err || !article) {
                    cb(null, {});
                }
                else {
                    author_id = article.author_id;
                    if (author_id != req.session.user.id) {
                        res.render('notify/notify', {
                        	current	: 'blog',
                			active	: 'user_index',
                            error : '您不具备编辑该文章的权限'
                        });
                        return;
                    }
                    cb(null, article);
                }
            });
        },
        all_categories : [ 'article', function(cb) {
            categoryDao.queryCategoriesOfUser(author_id, function(err, categories) {
                if (err || !categories) {
                    cb(null, []);
                }
                else {
                    cb(null, categories);
                }
            });
        } ],
        article_categories : function(cb) {
            categoryDao.queryCategoriesOfArticle(article_id, function(err, article_categories) {
                if (err || !article_categories) {
                    cb(null, []);
                }
                else {
                    cb(null, article_categories);
                }
            });
        }
    }, function(err, results) {
        if (err) {
            res.render('notify/notify', {
            	current	: 'blog',
    			active	: 'user_index',
                error : '您要编辑的文章信息存在错误'
            });
            return;
        }

        for ( var i = 0; results.all_categories.length && i < results.all_categories.length; i++) {
            for ( var j = 0; j < results.article_categories.length; j++) {
                if (results.article_categories[j].id == results.all_categories[i].id) {
                    results.all_categories[i].is_selected = true;
                }
            }
        }

        res.render('article/edit', {
        	current	: 'blog',
			active	: 'user_index',
            article : results.article,
            categories : results.all_categories,
            user_id :req.session.user.id
        });
        return;
    });
};

/**
 * 更改文章
 */
exports.modifyArticle = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
            error : '未登录用户不能修改文章'
        });
        return;
    }
    var article_id = req.params.article_id;
    var title = sanitize(req.body.title).trim();
    title = sanitize(title).xss();
    var content = req.body.content;
    var article_categories = [];
    if (req.body.article_categories != '') {
        article_categories = req.body.article_categories.split(',');
    }
    var updateDate = Util.format_date(new Date());
    var tags  = req.body.tag;
    async.auto({
        updateArticle : function(cb) {// 更新文章基本信息
            articleDao.updateArticle(title, content, updateDate, article_id,tags, function(err, info) {
                if (err) {
                    res.render('notify/notify', {
                        error : '修改文章发生错误'
                    });
                    return;
                }
                cb(null, '');
            });
        },
        deleteCategoriesOfArticle : [ 'updateArticle', function(cb) {// 删除旧的文章分类
            articleCategoryDao.deleteCategoriesOfArticle(article_id, function(err, info) {
                if (err) {
                    log.error('删除文章旧分类发生异常,articleId:' + article_id);
                }
                cb(null, '');
            });
        } ],
        saveCategoriesOfArticle : [ 'deleteCategoriesOfArticle', function(cb) {// 插入新的文章分类
            categoryDao.saveCategoriesOfArticle(article_id, article_categories, function(err, categories) {
                if (err) {
                    log.error('修改文章：插入新的文章分类出现错误[' + article_id + ',' + article_categories + ']');
                }
                cb(null, '');
            });
        } ],
    }, function(err, results) {
        if (err) {
            res.render('notify/notify', {
            	current	: 'blog',
    			active	: 'user_index',
                error : '修改文章时发生错误'
            });
            return;
        }
        res.redirect('/article/' + article_id);
    });
};

/**
 * 删除文章
 * 
 * @param req
 * @param res
 * @param next
 */
exports.deleteArticle = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
            error : '未登录用户不能删除文章'
        });
        return;
    }
    articleDao.deleteArticle(req.params.article_id, req.session.user.id, function(err, info) {
        if (err) {
            res.render('notify/notify', {
            	current	: 'blog',
    			active	: 'user_index',
                error : '删除文章出错,请检查您是否为该文章作者或者操作是否出错'
            });
            return;
        }
        articleCategoryDao.deleteCategoriesOfArticle(req.params.article_id, function(err, info) {
            if (err) {
                res.render('notify/notify', {
                	current	: 'blog',
        			active	: 'user_index',
                    error : '从文章分类中删除这篇文章出错'
                });
                return;
            }

            replyDao.deleteRepliesOfArticle(req.params.article_id, function(err, info) {
                if (err) {
                    res.render('notify/notify', {
                    	current	: 'blog',
            			active	: 'user_index',
                        error : '删除这篇文章的回复出错'
                    });
                    return;
                }
                res.render('notify/notify', {
                	current	: 'blog',
        			active	: 'user_index',
                    success : '删除文章成功'
                });
                return;
            });
        });
    });
};

/**
 * 查看用户的文章[不按分类]
 */
exports.viewArticlesOfUser = function(req, res, next) {
    var user_id = req.params.user_id;
	
	var page  = Number(req.query.page) || 1;
	var page_size = Number(req.query.page_size) || 6;
	var start = (page - 1)*page_size;
		async.auto({
	        articles : function(cb) {
				articleDao.queryArticlesOfUser(user_id,start,page_size, function(err, articles) {
					if (err) {
	                    cb(null, []);
	                }
	                if (!articles) {
	                    cb(null, []);
	                }
	                cb(null, articles);
				})
	        },
	        pages : function(cb) {
	           articleDao.queryArticlesOfUserTotal(user_id, function(err, total) {
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
	        		current	: 'blog',
	     			active	: 'user_index',
                	error : '查找用户的所有文章出错'
            	});
            	return;
	        }
			res.render('article/user_articles', {
			current	: 'blog',
			active	: 'user_index',
            user_id : user_id,
            articles : results.articles,
			pages : results.pages,
			current_page :page
        	});
        return;
	    });
	
     
};

/**
 * 查看用户某分类下文章
 */
exports.viewArticlesOfUserCategory = function(req, res, next) {
    var category_id = req.params.category_id;
    var user_id = req.params.user_id;
    var page  = Number(req.query.page) || 1;
	var page_size = Number(req.query.page_size) || 6;
	var start = (page - 1)*page_size;
	async.auto({
        articles : function(cb) {
			 articleDao.queryArticlesOfUserCategory(user_id, category_id,start,page_size, function(err, articles) {
		        if (err) {
		            res.render('notify/notify', {
		            	current	: 'blog',
		    			active	: 'user_index',
		                error : '查找分类下文章出错'
		            });
		            return;
		        }
		        
		        cb(null, articles);
			 })
        },
        pages : function(cb) {
           articleDao.queryArticlesOfUserCategoryTotal(user_id,category_id, function(err, total) {
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
        		 current	: 'blog',
     			 active	: 'user_index',
                 error : '查找分类下文章出错'
             });
        	return;
        }
        categoryDao.queryCategory(category_id, function(err, category) {
            res.render('article/articles', {
            	current	: 'blog',
    			active	: 'user_index',
                user_id : user_id,
                articles : results.articles,
                current_page :page,
                pages : results.pages,
                category : category || {}
            });
            return;
        });
        
    });
};

/**
 * 发布新文章
 */
exports.createArticle = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
            error : '未登录用户不能发布文章'
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
            res.render('article/create', {
            	current	: 'blog',
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
        var article_categories = [];
        if (req.body.article_categories != '') {
            article_categories = req.body.article_categories.split(',');
        }
        var tags  = req.body.tag;
        var insertDate = Util.format_date(new Date());
        articleDao.saveArticle(title, content, req.session.user.id, insertDate,tags, function(err ,info){
            if (err) {
                res.render('notify/notify', {
                	current	: 'blog',
        			active	: 'user_index',
                    error : '保存文章时发生错误'
                });
                return;
            }

            categoryDao.saveCategoriesOfArticle(info.insertId,article_categories, function(err, categories){
                if (err) {
                    res.render('notify/notify', {
                    	current	: 'blog',
            			active	: 'user_index',
                        error : '保存文章分类时发生错误'
                    });
                    return;
                }
                else {
                      res.redirect('/article/' + info.insertId);
                }
            });         
        });
    }
};
