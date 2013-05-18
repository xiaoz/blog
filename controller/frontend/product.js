var async = require('async');
var mysql = require('../../lib/mysql.js');
var Util = require('../../lib/util.js');
var userDao = require('../../dao/user.js');

var check = require('validator').check;
var sanitize = require('validator').sanitize;
var common = require('./../common/common.js');
var memssage_ctrl = require('./../message/message.js');
var log = require('../../lib/log.js');
var articleDao = require('../../dao/product.js');
var categoryDao = require('../../dao/product_categorys.js');
var replyDao = require('../../dao/reply.js');
var articleCategoryDao = require('../../dao/product_category.js');


var siteconfigDao = require('../../dao/siteconfig.js');


/*网站首页产品展示*/
exports.product = function(req, res, next) {
	/*网站首页查看用户的产品[不按分类] 默认为管理者*/
	//var user_id = req.params.user_id;
	var user_id = 1;
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
	        new_replies : function(cb) {
					replyDao.queryNewRepliesOfProduct(2,function(err,replies){
						if (err) {
		                    cb(null, []);
		                }
			    		async.map(replies, function(reply_item, callback) {
			                    reply_item.friendly_create_at = Util.format_date(reply_item.create_at, true);
			                    callback(null, reply_item);
			            }, function(err, new_replies) {
			            	 cb(null, new_replies);
			            });
					})
		      },
	        categories : function(cb) {
						categoryDao.queryCategoriesOfUser(1,function(err,categories){
							if (err) {
			                    cb(null, []);
			                }
				            cb(null, categories);
						})
			 }
	    }, function(err, results) {
	        if (err) {
	        	 res.render('frontend/notify/notify', {
				 	layout: 'frontend/flayout',
					active : 'news',
                	error : '查找用户的所有产品出错'
            	});
            	return;
	        }
	        res.render('frontend/product', {
	    		layout: 'frontend/flayout',
	        	active : 'product',
	        	user_id : user_id,
	        	articles : results.articles,
	        	pages : results.pages,
				current_page :page,
				replies:results.new_replies,
				categorys : results.categories,
				category : {}
	        });
        return;
	    });
		
   

};
/*网站首页查看某篇产品*/
exports.viewProductForFront = function(req, res, next) {
	
    var product_id = req.query.product_id;
    var author_id;
    async.auto({
        article : function(cb) {
            articleDao.queryArticle(product_id, function(err, article) {
                if (err || !article) {
                    res.render('frontend/notify/notify', {
						layout: 'frontend/flayout',
						active : 'news',
                        error : '您查找的产品信息存在错误,该产品可能已被删除'
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
            articleDao.updateVisitCountOfArticle(product_id, function(err, info) {
                cb(null, null);
            });
        } ],
        article_categories : function(cb) {
            categoryDao.queryCategoriesOfProduct(product_id, function(err, categories) {
                if (err || !categories) {
                    cb(null, []);
                }
                else {
                    cb(null, categories);
                }
            });
        },
        article_replies : function(cb) {// 该篇产品的回复
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
            res.render('frontend/notify/notify', {
				layout: 'frontend/flayout',
				active : 'news',
                error : '您查找的产品信息存在错误'
            });
            return;
        }
        results.article.replies = results.article_replies;
        res.render('frontend/product/detail_product', {
			layout: 'frontend/flayout',
			active : 'product',
            author : results.author,
            article : results.article,
            article_categories : results.article_categories
        });
        return;
    });
};

/*网站首页查看用户某分类下产品*/

exports.viewProductsOfUserCategoryForFront = function(req, res, next) {
    var category_id = req.query.category_id;
    var user_id = req.query.user_id;
    var page  = Number(req.query.page) || 1;
	var page_size = Number(req.query.page_size) || 6;
	var start = (page - 1)*page_size;
	async.auto({
        articles : function(cb) {
			 articleDao.queryArticlesOfUserCategory(user_id, category_id,start,page_size, function(err, articles) {
		        if (err) {
		            res.render('frontend/notify/notify', {
						layout: 'frontend/flayout',
						active : 'product',
		                error : '查找分类下产品出错'
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
        new_replies : function(cb) {
			replyDao.queryNewRepliesOfProduct(2,function(err,replies){
				if (err) {
                    cb(null, []);
                }
	    		async.map(replies, function(reply_item, callback) {
	                    reply_item.friendly_create_at = Util.format_date(reply_item.create_at, true);
	                    callback(null, reply_item);
	            }, function(err, new_replies) {
	            	 cb(null, new_replies);
	            });
			})
      },
      categories : function(cb) {
			categoryDao.queryCategoriesOfUser(1,function(err,categories){
				if (err) {
                  cb(null, []);
              }
	            cb(null, categories);
			})
      }
      
    }, function(err, results) {
        if (err) {
        	 res.render('frontend/notify/notify', {
			 	layout: 'frontend/flayout',
				active : 'product',
                 error : '查找分类下产品出错'
             });
        	return;
        }
        categoryDao.queryCategory(category_id, function(err, category) {
        	  res.render('frontend/product', {
  	    		layout: 'frontend/flayout',
  	        	active : 'product',
  	        	user_id : user_id,
  	        	articles : results.articles,
  	        	pages : results.pages,
  				current_page :page,
  				replies:results.new_replies,
  				categorys : results.categories,
  				category : category || {}
  	        });
            return;
        });
        
    });
};
/**
 * 添加用户信息
 * 
 * @param files
 * @param func
 */
function file_user_info(files, func) {
    async.map(files, function(file, callback) {
        userDao.queryUser(file.user_id, function(err, user) {
            if (err || !user) {
                file.user = {};
                callback(null, file);
            }
            else {
                file.user = user;
                callback(null, file);
            }
        });
    }, function(err, files) {
        func(err, files);
    });
}
