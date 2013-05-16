var articleDao = require('../../dao/article.js');

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
                }
                else
                    cb(null, articles);
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
                res.local('contact_detail', result.info.contact_detail);
                res.local('about_detail', result.info.about_detail);
				res.local('new_articles', result.articles);
                return next();
            }else{
            	 return next();
            }
    });
		
};
