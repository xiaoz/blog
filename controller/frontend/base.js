var articleDao = require('../../dao/article.js');
var productDao = require('../../dao/product.js');
var siteconfigDao = require('../../dao/siteconfig.js');
var Util = require('../../lib/util.js');
var async = require('async');

/**
 * base_info middleware
 */
exports.base_info = function(req, res, next) {
    async.parallel({
        articles : function(cb) {// 关注
            articleDao.queryNewArticle(5, function(err, articles) {
                if (err || !articles) {
                    cb(null, {
                        articles : {}
                    });
                }else{
                	 if(articles instanceof Array){
   					  for(var i =0,len = articles.length ; i< len ; i++){
   						  articles[i].thumbnails = articles[i].content.match(/\/user_data\/images\/1\/\d+\.\w+/) || "/user_data/images/default.jpg";
   					  }
                	 }
                	 cb(null, articles);
                }
                    
            });
        },
        products : function(cb) {// 关注
        	productDao.queryNewProduct(5, function(err, products) {
                if (err || !products) {
                    cb(null, {
                    	products : {}
                    });
                }else{
                	 cb(null, products);
                }
                    
            });
        },
        info : function(cb) {
            siteconfigDao.queryCompanyInfo(function(err, info) {
				if (err || !info) {
                    cb(null, {
                        info : {}
                    });
                }else{
					 cb(null, info);
				}
	        });
        },
    }, function(err, result) {
			if (err)
                return next(err);
            if (result) {
            	res.local('site_info', JSON.parse(result.info[0].shop_config));
                res.local('company_info', JSON.parse(result.info[0].company_info));
                res.local('about_info',  JSON.parse(result.info[0].about_info));
                res.local('contact_detail', result.info[0].contact_detail);
                res.local('about_detail', result.info[0].about_detail);
				res.local('new_articles', result.articles);
				res.local('new_products', result.products);
                return next();
            }else{
            	 return next();
            }
    });
		
};
