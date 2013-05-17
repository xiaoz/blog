var check = require('validator').check;
var	sanitize = require('validator').sanitize;
var async = require('async');
var Util = require('../../lib/util.js');
var replyDao = require('../../dao/reply.js');
var articleDao = require('../../dao/article.js');
var productDao = require('../../dao/product.js');
var userDao = require('../../dao/user.js');
var common = require('../common/common.js');
var memssage_ctrl = require('../message/message.js');
/**
 * 联系我们
 */
exports.sendReply = function(req,res,next){
	var content = req.body.u_comment;
	var title = req.body.u_subject || '';
	var userName = sanitize(req.body.u_name).trim();
	var userEmail = sanitize(req.body.u_mail).trim();
	userName = sanitize(userName).xss();
	var phone = req.body.u_phone || '';
	var site = req.body.u_site || '' ;
	
	var mbody = {};
    mbody.userName = userName;
    mbody.userEmail = userEmail;
    mbody.title = title;
    mbody.content = content;
    mbody.phone = phone;
    mbody.site = site;
    
    if (userName == '' || userEmail == '' || content == '') {
		 res.json({error : '信息不完整！',status : '0'})
       return;
    }
	 try {
         check(userEmail, '不正确的电子邮箱!').isEmail();
     }catch (e) {
    	  res.json({error : '不正确的电子邮箱！',status : '1'})
    	 return;
     }
     var create_at =  Util.format_date(new Date());
      memssage_ctrl.create_message(common.MessageType.subject, 1 , JSON.stringify(mbody), function(flag){
    	  //成功发送
    	  if(flag){
		  	 res.json({success : '您的消息已经成功发送，我们会尽快联系您！',status : '2'})
    	  }else{
		  	 res.json({error : '发送消息失败！',status : '3'})
    	  }
      });

};

/**
 * 前台产品回复
 */
exports.sendProductMsg = function(req,res,next){
	var content = req.body.u_comment;
	var product_id = req.query.product_id;
	var userName = req.body.u_name;
	var userEmail = req.body.u_mail;

    if (userName == '' || userEmail == '' || content == '') {
    	  res.render('frontend/notify/notify', {
				layout: 'frontend/flayout',
				active : 'product',
            error : '信息不完整！'
        });
        return;
    }
	 try {
         check(userEmail, '不正确的电子邮箱。').isEmail();
     }
     catch (e) {
    	 res.render('frontend/notify/notify', {
				layout: 'frontend/flayout',
				active : 'product',
				error : '不正确的电子邮箱！'
    	 });
    	 return;
     }
	var create_at =  Util.format_date(new Date());
	var user_info = "用户名："+userName+",邮箱:"+userEmail;
	async.parallel({
        info : function(cb) {
            replyDao.saveProductReply(content, 3, product_id, create_at,user_info, function(err, info){
                cb(null,null);
            });
        },
        update_reply_count : function(cb) {
        	productDao.updateReplyCountOfArticle(product_id, true, function(err, info){
                cb(null,null);
            });
        },
        sendMessage : function(cb) {
        	productDao.queryArticle(product_id, function(err, article){
                if(!err){
                    var mbody = {};
                    mbody.from_user_id = 1;
                    mbody.from_user_name = user_info;
                    mbody.article_id = product_id;
                    mbody.article_title = article.title;
                    memssage_ctrl.create_message(common.MessageType.product, article.author_id, JSON.stringify(mbody), function(){
                        cb(null,null);
                    });
                }
                cb(null,null);
            });
        }
    }, function(err, results) {
    	 if(err){
         	res.render('frontend/notify/notify', {
 				layout: 'frontend/flayout',
 				active : 'product',
 				error : (results.info || '')+(results.update_reply_count || '')
 	    	 });
 	    	 return;
         }
         res.redirect('/productdetail?product_id='+product_id);
    });

};

/**
 * 前台文章回复
 */
exports.sendMsg = function(req,res,next){
	var content = req.body.u_comment;
	var article_id = req.query.article_id;
	var userName = req.body.u_name;
	var userEmail = req.body.u_mail;

    if (userName == '' || userEmail == '' || content == '') {
    	  res.render('frontend/notify/notify', {
				layout: 'frontend/flayout',
				active : 'news',
            error : '信息不完整！'
        });
        return;
    }
	 try {
         check(userEmail, '不正确的电子邮箱。').isEmail();
     }
     catch (e) {
    	 res.render('frontend/notify/notify', {
				layout: 'frontend/flayout',
				active : 'news',
				error : '不正确的电子邮箱！'
    	 });
    	 return;
     }
	var create_at =  Util.format_date(new Date());
	var user_info = "用户名："+userName+",邮箱:"+userEmail;
	async.parallel({
        info : function(cb) {
            replyDao.saveReply(content, 3, article_id, create_at,user_info, function(err, info){
                cb(null,null);
            });
        },
        update_reply_count : function(cb) {
            articleDao.updateReplyCountOfArticle(article_id, true, function(err, info){
                cb(null,null);
            });
        },
        sendMessage : function(cb) {
            articleDao.queryArticle(article_id, function(err, article){
                if(!err){
                    var mbody = {};
                    mbody.from_user_id = 1;
                    mbody.from_user_name = "用户名："+userName+",邮箱:"+userEmail;
                    mbody.article_id = article_id;
                    mbody.article_title = article.title;
                    memssage_ctrl.create_message(common.MessageType.reply, article.author_id, JSON.stringify(mbody), function(){
                        cb(null,null);
                    });
                }
                cb(null,null);
            });
        }
    }, function(err, results) {
    	 if(err){
         	res.render('frontend/notify/notify', {
 				layout: 'frontend/flayout',
 				active : 'news',
 				error : (results.info || '')+(results.update_reply_count || '')
 	    	 });
 	    	 return;
         }
         res.redirect('/newsdetail?article_id='+article_id);
    });

};

