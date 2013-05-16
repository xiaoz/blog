var check = require('validator').check;
var	sanitize = require('validator').sanitize;
var async = require('async');
var Util = require('../../lib/util.js');
var replyDao = require('../../dao/reply.js');
var articleDao = require('../../dao/article.js');
var userDao = require('../../dao/user.js');
var common = require('../common/common.js');
var memssage_ctrl = require('../message/message.js');
/**
 * 联系我们
 */
exports.sendReply = function(req,res,next){
	var content = req.body.u_comment;
	var title = req.body.u_subject;
	var userName = sanitize(req.body.u_name).trim();
	var userEmail = sanitize(req.body.u_mail).trim();
	userName = sanitize(userName).xss();
	var phone = sanitize(req.body.u_phone).trim();
	var site = sanitize(req.body.u_site).trim();
	
	var mbody = {};
    mbody.userName = userName;
    mbody.userEmail = userEmail;
    mbody.title = title;
    mbody.content = content;
    mbody.phone = phone;
    mbody.site = site;
    
    if (userName == '' || userEmail == '' || content == '') {
    	 res.render('frontend/contact', {
				layout: 'frontend/flayout',
		    	active : 'contact',
		    	error : '信息不完整！',
		    	mbody : mbody
		 });
       return;
    }
	 try {
         check(userEmail, '不正确的电子邮箱。').isEmail();
     }catch (e) {
    	 res.render('frontend/contact', {
				layout: 'frontend/flayout',
		    	active : 'contact',
		    	error : '不正确的电子邮箱！',
		    	mbody : mbody
		    });
    	 return;
     }
       var create_at =  Util.format_date(new Date());
	  
      memssage_ctrl.create_message(common.MessageType.subject, 1 , JSON.stringify(mbody), function(flag){
    	  //成功发送
    	  if(flag){
    		  res.render('frontend/contact', {
  				layout: 'frontend/flayout',
  		    	active : 'contact',
  		    	success : '您的消息已经成功发送，我们会尽快联系您！'
  		    });
    	  }else{
    		  res.render('frontend/contact', {
  				layout: 'frontend/flayout',
  		    	active : 'contact',
  		    	error : '发送消息失败！'
  		    });
			
    	  }
         
      });

};

exports.sendMsg = function(req,res,next){
	var content = req.body.u_comment;
	var title = req.body.u_subject;
	var userName = sanitize(req.body.u_name).trim();
	var userEmail = sanitize(req.body.u_mail).trim();
	userName = sanitize(userName).xss();
	var phone = sanitize(req.body.u_phone).trim();
	var site = sanitize(req.body.u_site).trim();
	
	var mbody = {};
    mbody.userName = userName;
    mbody.userEmail = userEmail;
    mbody.title = title;
    mbody.content = content;
    mbody.phone = phone;
    mbody.site = site;
    
    if (userName == '' || userEmail == '' || content == '') {
    	 res.render('frontend/contact', {
				layout: 'frontend/flayout',
		    	active : 'contact',
		    	error : '信息不完整！',
		    	mbody : mbody
		 });
       return;
    }
	 try {
         check(userEmail, '不正确的电子邮箱。').isEmail();
     }catch (e) {
    	 res.render('frontend/contact', {
				layout: 'frontend/flayout',
		    	active : 'contact',
		    	error : '不正确的电子邮箱！',
		    	mbody : mbody
		    });
    	 return;
     }
       var create_at =  Util.format_date(new Date());
	  
      memssage_ctrl.create_message(common.MessageType.subject, 1 , JSON.stringify(mbody), function(flag){
    	  //成功发送
    	  if(flag){
    		  res.render('frontend/contact', {
  				layout: 'frontend/flayout',
  		    	active : 'contact',
  		    	success : '您的消息已经成功发送，我们会尽快联系您！'
  		    });
    	  }else{
    		  res.render('frontend/contact', {
  				layout: 'frontend/flayout',
  		    	active : 'contact',
  		    	error : '发送消息失败！'
  		    });
			
    	  }
         
      });

};

/**
 * 管理员回复文章
 */
exports.adminReply = function(req,res,next){
	if(!req.session || !req.session.user){
		res.send('forbidden!须登录才可发表回复');
		return;
	}

	var content = req.body.r_content;
	var article_id = req.params.article_id;

	var str = sanitize(content).trim();
	if(str == ''){
		res.render('notify/notify',{error:'回复内容不能为空！'});
		return;
	}
	
	var create_at =  Util.format_date(new Date());
	async.parallel({
        info : function(cb) {
            replyDao.saveReply(content, req.session.user.id, article_id, create_at, function(err, info){
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
                    mbody.from_user_id = req.session.user.id;
                    mbody.from_user_name = req.session.user.loginname;
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
            res.render('notify/notify',{error:((results.info || '')+(results.update_reply_count || ''))});
            return;
        }
        res.redirect('/article/'+article_id);
    });
};


/**
 * 回复文章
 */
exports.createReply = function(req,res,next){
	var content = req.body.r_content;
	var article_id = req.params.article_id;
	var str = sanitize(content).trim();
	var userName = sanitize(req.body.userName).trim();
	var userEmail = sanitize(req.body.userEmail).trim();
	userName = sanitize(userName).xss();

    if (userName == '' || userEmail == '') {
    	
    	
       return;
    	
    }
	if(str == ''){
		  res.render('front/notify/notify', {
				layout: 'flayout',
				active : 'news',
              error : '回复内容不能为空！'
          });
          return;
	}
	
	 try {
         check(userEmail, '不正确的电子邮箱。').isEmail();
     }
     catch (e) {
         res.render('sign/signup', {
             error : e.message,
             name : name,
             email : email
         });
         return;
     }
	
	var create_at =  Util.format_date(new Date());
	async.parallel({
        info : function(cb) {
            replyDao.saveReply(content, req.session.user.id, article_id, create_at, function(err, info){
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
                    mbody.from_user_id = req.session.user.id;
                    mbody.from_user_name = req.session.user.loginname;
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
            res.render('notify/notify',{error:((results.info || '')+(results.update_reply_count || ''))});
            return;
        }
        res.redirect('/article/'+article_id);
    });
};

/**
 * 删除回复
 */
exports.deleteReply = function(req,res,next){
	if(!req.session || !req.session.user){
	    res.json({status:'failed'});
        return;
    }
	
	var article_id = req.body.article_id;
	var reply_id = req.body.reply_id;
	replyDao.deleteReply(req.session.user.id, reply_id, function(err, info){
	    if(err){
	        res.json({status:'failed'});
	        return;
	    }
	    articleDao.updateReplyCountOfArticle(article_id, false, function(err, info){
            res.json({status:'success'});
            return;
        });
	});
};

