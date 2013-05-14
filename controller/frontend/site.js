var async = require('async');
var mysql = require('../../lib/mysql.js');
var Util = require('../../lib/util.js');
var userDao = require('../../dao/user.js');

var check = require('validator').check;
var sanitize = require('validator').sanitize;
var common = require('./../common/common.js');
var memssage_ctrl = require('./../message/message.js');
var log = require('../../lib/log.js');
var articleDao = require('../../dao/article.js');
var categoryDao = require('../../dao/category.js');
var replyDao = require('../../dao/reply.js');
var articleCategoryDao = require('../../dao/article_category.js');

var folderDao = require('../../dao/folder.js');
var fileDao = require('../../dao/file.js');


var siteconfigDao = require('../../dao/siteconfig.js');

/*网站首页主体数据*/
exports.index = function(req, res, next) {
    
        res.render('frontend/index', {
			layout: 'frontend/flayout',
        	active : 'index'
        });
  
};
/*网站首页关于我们*/
exports.about = function(req, res, next) {
    
    res.render('frontend/about', {
		layout: 'frontend/flayout',
    	active : 'about'
    });

};
/*网站首页产品展示*/
exports.product = function(req, res, next) {
    
    res.render('frontend/product', {
		layout: 'frontend/flayout',
    	active : 'product'
    });

};
/*网站首页新闻*/
exports.news = function(req, res, next) {
	/*网站首页查看用户的文章[不按分类] 默认为管理者*/
	//var user_id = req.params.user_id;
	var user_id = 1;
	var page  = Number(req.query.page) || 1;
	var page_size = Number(req.query.page_size) || 5;
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
					 if(articles instanceof Array){
						  for(var i =0,len = articles.length ; i< len ; i++){
							  articles[i].thumbnails = articles[i].content.match(/\/user_data\/images\/1\/\d+\.\w+/) || "/user_data/images/default.jpg";
							  var tcontent  = articles[i].content.match(/[^\x00-\xff]/g); 
							  articles[i].thumbcontent  = tcontent == null ? "暂无内容" :  tcontent.join('').substring(0,107);
						  }
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
	        	 res.render('frontend/notify/notify', {
				 	layout: 'frontend/flayout',
					active : 'news',
                	error : '查找用户的所有文章出错'
            	});
            	return;
	        }
	        res.render('frontend/news', {
	    		layout: 'frontend/flayout',
	        	active : 'news',
	        	user_id : user_id,
	        	articles : results.articles,
	        	pages : results.pages,
				current_page :page,
	        });
        return;
	    });
		
   

};
/*网站首页查看某篇文章*/
exports.viewArticleForFront = function(req, res, next) {
	
    var article_id = req.query.article_id;
    var author_id;
    async.auto({
        article : function(cb) {
            articleDao.queryArticle(article_id, function(err, article) {
                if (err || !article) {
                    res.render('frontend/notify/notify', {
						layout: 'frontend/flayout',
						active : 'news',
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
                error : '您查找的文章信息存在错误'
            });
            return;
        }
        results.article.replies = results.article_replies;
        res.render('frontend/news/detail_news', {
			layout: 'frontend/flayout',
			active : 'news',
            author : results.author,
            article : results.article,
            article_categories : results.article_categories
        });
        return;
    });
};

/*网站首页查看用户某分类下文章*/

exports.viewArticlesOfUserCategoryForFront = function(req, res, next) {
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
						active : 'news',
		                error : '查找分类下文章出错'
		            });
		            return;
		        }
		        if(articles instanceof Array){
					  for(var i =0,len = articles.length ; i< len ; i++){
						  articles[i].thumbnails = articles[i].content.match(/\/user_data\/images\/1\/\d+\.\w+/) || "/user_data/images/default.jpg";
						  var tcontent  = articles[i].content.match(/[^\x00-\xff]/g); 
						  articles[i].thumbcontent  = tcontent == null ? "暂无内容" :  tcontent.join('').substring(0,107);
					  }
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
        	 res.render('frontend/notify/notify', {
			 	layout: 'frontend/flayout',
				active : 'news',
                 error : '查找分类下文章出错'
             });
        	return;
        }
        categoryDao.queryCategory(category_id, function(err, category) {
            res.render('front/news', {
				layout: 'flayout',
	        	active : 'news',
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

/**
 * 一级导航：‘文件’
 */
exports.filesForFront = function(req, res, next) {

    async.auto({
        new_files : function(cb) {
            fileDao.queryNewFiles(8, function(err, new_files) {
                if (err) {
                    res.render('notify/notify', {
                        error : '查询最新文件列表出错'
                    });
                    return;
                }
                else {
                    file_user_info(new_files, function(err, new_files) {
                        cb(null, new_files);
                    });
                }
            });
        },
        hot_files : function(cb) {
            fileDao.queryHotFiles(10, function(err, hot_files) {
                if (err) {
                    res.render('notify/notify', {
                        error : '查询最新文件列表出错'
                    });
                    return;
                }
                else {
                    file_user_info(hot_files, function(err, hot_files) {
                        cb(null, hot_files);
                    });
                }
            });
        },
    }, function(err, results) {
        if (err) {
            res.render('front/notify/notify', {
                error : '查找文件列表失败'
            });
            return;
        }
        res.render('files', {
            new_files : results.new_files,
            hot_files : results.hot_files
        });
        return;
    });

};
/**
 * 查询文件夹下文件列表
 */
exports.viewFilesOfFolderForFront = function(req, res, next) {
    if (!req.session || !req.session.user) {
        res.render('notify/notify', {
            error : '你还没有登录,不能查看您网盘中的文件'
        });
        return;
    }

    var folder_id = req.params.folder_id;
    var user_id = req.session.user.id;

    folderDao.queryFolder(user_id, folder_id, function(err, folder) {
        if (err) {
            res.render('notify/notify', {
                error : '查找文件夹基本信息出错'
            });
            return;
        }
        else if (!folder || folder.length <= 0) {
            res.render('notify/notify', {
                error : '该文件夹不存在或您不具备访问该文件夹的权限'
            });
            return;
        }
        else {
            fileDao.queryFiles(folder_id, user_id, function(err, files) {
                if (err) {
                    res.render('vdisk/folder_files', {
                        files : [],
                        folder : folder,
                        folders : [],
                        user_id : user_id
                    });
                    return;
                }
                folderDao.queryAllFoldersOfUser(user_id, function(err, folders) {
                    res.render('vdisk/folder_files', {
                        files : files || [],
                        folder : folder,
                        folders : folders || [],
                        user_id : user_id
                    });
                    return;
                });
            });
        }
    });
};


var jodDao = require('../../dao/jod.js');


/*网站首页工作案例*/
exports.cases = function(req, res, next) {
    
	jodDao.queryJodInfo(function(err,info){
		 if(err){
			 res.render('frontend/notify/notify', {
				 	layout: 'frontend/flayout',
					active : 'cases',
	                error : 'err'
	             });
			 return ;
		 }
		 var jod = info[0].comtent;
		 res.render('frontend/cases', {
				layout: 'frontend/flayout',
		    	active : 'cases',
		    	info : jod
		    });
	})
};
/*网站首页主体联系我们*/
exports.contact = function(req, res, next) {
    res.render('frontend/contact', {
		layout: 'frontend/flayout',
    	active : 'contact'
    });

};

