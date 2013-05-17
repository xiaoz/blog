var async = require('async');
var Util = require('../../lib/util.js');
var userDao = require('../../dao/user.js');
var messageDao = require('../../dao/message.js');

/**
 * 创建消息，消息发送给user_id
 */
exports.create_message = function(type, user_id, content, cb) {
    var create_at = Util.format_date(new Date());
    messageDao.saveMessage(type, user_id, content, create_at, function(err, info) {
        if (err) {
            log.error('create_message发送消息失败[' + type + ',' + user_id + ',' + content + ']');
            if (cb && typeof cb == 'function')
                cb(false);
        }
        if (cb && typeof cb == 'function')
            cb(true);
    });
};

/**
 * 批量创建消息，消息发送给user_id的所有好友
 */
exports.batch_create_message = function(type, user_id, content, cb) {
    var create_at = Util.format_date(new Date());
    userDao.queryAllFollowers(user_id, function(err, users) {
        async.forEach(users, function(user, callback) {
            messageDao.saveMessage(type, user.id, content, create_at, function(err, info) {
                if (err) {
                    log.error('batch_create_message发送消息失败[' + type + ',' + user.id + ',' + content + ']');
                }
                callback();
            });
        }, function(err) {
            cb(err);
        });
    });
};

/**
 * 查看所有消息
 */
exports.view_messages = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
            error : '未登录用户不能查看消息'
        });
        return;
    }
    var user_id = req.session.user.id;
    var type_id = req.params.type;
    
    var page  = Number(req.query.page) || 1;
	var page_size = Number(req.query.page_size) || 6;
	var start = (page - 1)*page_size;
    
    async.auto({
        unread_messages : function(cb) {// 未读消息
            messageDao.queryMessagesOfUser(user_id, 0,type_id, function(err, unread_messages) {
                if (err || !unread_messages) {
                    cb(null, []);
                }
                cb(null, unread_messages);
            });
        },
        hasread_messages : function(cb) {// 已读消息
            messageDao.queryMessagesOfUser(user_id, 1, type_id,function(err, hasread_messages) {
                if (err || !hasread_messages) {
                    cb(null, []);
                }
                cb(null, hasread_messages);
            });
        }
    }, function(err, results) {
        if (err) {
            res.render('notify/notify', {
                error : '查询已读消息发生错误'
            });
            return;
        }

        res.render('message/index', {
        	current: 'message',
        	active : type_id,
            unread_messages : results.unread_messages,
            hasread_messages : results.hasread_messages
        });
        return;
    });
};

/**
 * 未读消息数
 */
exports.unread_message_count = function(req, res, next) {
    if (!req.session.user) {
        res.json({
            count : 0
        });
        return;
    }
    var user_id = req.session.user.id;
    async.auto({
        unread_messages3 : function(cb) {// 未读消息3
    	 	messageDao.queryMessagesOfUser(user_id, 0, 3,function(err, unread_messages) {
    	 		 if (err || !unread_messages) {
                     cb(null, []);
                 }
                 cb(null, unread_messages);
    	    });
        },
        unread_messages7 : function(cb) {// 未读消息7
        	messageDao.queryMessagesOfUser(user_id, 0, 7,function(err, unread_messages) {
   	 		 if (err || !unread_messages) {
                    cb(null, []);
                }
                cb(null, unread_messages);
        	});
        },
        unread_messages8 : function(cb) {// 已读消息8
        	messageDao.queryMessagesOfUser(user_id, 0, 8,function(err, unread_messages) {
   	 		 if (err || !unread_messages) {
                    cb(null, []);
                }
                cb(null, unread_messages);
        	});
        }
    }, function(err, results) {
        if (err) {
        	res.json({
                count : 0
            });
            return;
        }
        res.json({
            count1 : (results.unread_messages3 ? results.unread_messages3.length : 0),
            count2 : (results.unread_messages7 ? results.unread_messages7.length : 0),
            count3 : (results.unread_messages8 ? results.unread_messages8.length : 0)
        });
      
        return;
    });
};

/**
 * 标记所有消息为已读
 */
exports.mark_all_read = function(req, res, next) {
    var user_id = req.session.user.id;
    var type_id = req.params.type;
    messageDao.updateMessages(user_id ,type_id, function(err, info) {
        res.redirect('/messages/'+type_id);
        return;
    });
};
