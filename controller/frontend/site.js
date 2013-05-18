var async = require('async');
var mysql = require('../../lib/mysql.js');
var Util = require('../../lib/util.js');
var userDao = require('../../dao/user.js');
var focusDao = require('../../dao/focus.js');

var check = require('validator').check;
var sanitize = require('validator').sanitize;
var common = require('./../common/common.js');
var log = require('../../lib/log.js');

var siteconfigDao = require('../../dao/siteconfig.js');

var replyDao = require('../../dao/reply.js');

/*网站首页主体数据*/
exports.index = function(req, res, next) {
	async.auto({
		focus : function(cb) {
			focusDao.queryAllFocus( function(err, focus) {
				if (err) {
                    cb(null, []);
                }
                if (!focus) {
                    cb(null, []);
                }
                cb(null, focus);
			})
        },
        new_replies : function(cb) {
			replyDao.queryNewRepliesOfProduct(2,function(err,replies){
				async.map(replies, function(reply_item, callback) {
		                reply_item.friendly_create_at = Util.format_date(reply_item.create_at, true);
		                callback(null, reply_item);
		        }, function(err, new_replies) {
		        	 if (err) {
	                    cb(null, []);
	                 }
		        	 cb(null, new_replies);
		        });
			})
        },
      
    }, function(err, results) {
        if (err) {
        	 res.render('frontend/notify/notify', {
			 	layout: 'frontend/flayout',
				active : 'index',
            	error : '查找首页数据出错'
        	});
        	return;
        }
        res.render('frontend/index', {
			layout: 'frontend/flayout',
        	active : 'index',
        	replies:results.new_replies,
        	focus:results.focus
        });
        return;
    });
	
        
  
};
/*网站首页关于我们*/
exports.about = function(req, res, next) {
    
    res.render('frontend/about', {
		layout: 'frontend/flayout',
    	active : 'about'
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

