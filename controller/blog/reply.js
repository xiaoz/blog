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
 * 后台回复文章
 */
exports.createReply = function(req,res,next){
	var content = req.body.r_content;
	var article_id = req.params.article_id;
	var reply_id = req.body.reply_id;
	
	var str = sanitize(content).trim();
	if(str == ''){
		res.render('notify/notify',{error:'回复内容不能为空！'});
		return;
	}
	var create_at =  Util.format_date(new Date());
	async.parallel({
        info : function(cb) {
            replyDao.saveReply2(content, 1 , article_id, create_at,reply_id, function(err, info){
                cb(null,null);
            });
        },
        update_reply_count : function(cb) {
            articleDao.updateReplyCountOfArticle(article_id, true, function(err, info){
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

/**
 * 后台回复产品
 */
exports.createProductReply = function(req,res,next){
	var content = req.body.r_content;
	var product_id = req.params.product_id;
	var reply_id = req.body.reply_id;
	
	var str = sanitize(content).trim();
	if(str == ''){
		res.render('notify/notify',{error:'回复内容不能为空！'});
		return;
	}
	var create_at =  Util.format_date(new Date());
	async.parallel({
        info : function(cb) {
            replyDao.saveProductReply2(content, 1 , product_id, create_at,reply_id, function(err, info){
                cb(null,null);
            });
        },
        update_reply_count : function(cb) {
        	productDao.updateReplyCountOfArticle(product_id, true, function(err, info){
                cb(null,null);
            });
        }
    }, function(err, results) {
    	  if(err){
              res.render('notify/notify',{error:((results.info || '')+(results.update_reply_count || ''))});
              return;
          }
          res.redirect('/product/'+product_id);
    });
};

/**
 * 删除产品回复
 */
exports.deleteProductReply = function(req,res,next){
	if(!req.session || !req.session.user){
	    res.json({status:'failed'});
        return;
    }
	
	var article_id = req.body.article_id;
	var reply_id = req.body.reply_id;
	replyDao.deleteProductReply(req.session.user.id, reply_id, function(err, info){
	    if(err){
	        res.json({status:'failed'});
	        return;
	    }
	    productDao.updateReplyCountOfArticle(article_id, false, function(err, info){
            res.json({status:'success'});
            return;
        });
	});
};

