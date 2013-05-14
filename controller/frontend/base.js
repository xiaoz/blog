var siteconfigDao = require('../../dao/siteconfig.js');
var Util = require('../../lib/util.js');


/**
 * base_info middleware
 */
exports.base_info = function(req, res, next) {
        siteconfigDao.queryCompanyInfo(function(err, info) {
            if (err)
                return next(err);
            if (info) {
            	res.local('site_info', eval('(' + info[0].shop_config + ')'));
                res.local('company_info', eval('(' + info[0].company_info + ')'));
                res.local('about_info',  eval('(' + info[0].about_info + ')'));
                res.local('contact_detail', info[0].contact_detail);
                res.local('about_detail', info[0].about_detail);
                return next();
            }else{
            	 return next();
            }
        });
};
