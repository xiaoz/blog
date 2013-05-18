var mysql = require('../lib/mysql.js');
var Util = require('../lib/util.js');

/**
 * 根据文章id查询文章的评论信息
 */
exports.queryRepliesOfArticle = function(articleId, callback) {
    mysql.query('select * from reply where article_id = ? ', [ articleId ], function(err, replies) {
        callback(err, replies);
    });
};

/**
 * 根据文章id删除所有评论信息
 */
exports.deleteRepliesOfArticle = function(articleId, callback){
    mysql.update('delete from reply where article_id = ?', [ articleId], function(err, info) {
        callback(err, info);
    });
};

/**
 * 前台创建文章回复
 */
exports.saveReply = function(content, userId, articleId, createAt,user_info, callback){
    mysql.update('insert into reply(content,author_id,article_id,create_at,update_at,user_info) values(?,?,?,?,?,?)',[content, userId, articleId, createAt, createAt,user_info], function(err, info){
        callback(err, info);
    });
};
/**
 * 后台文章回复
 */
exports.saveReply2 = function(content, userId, articleId, createAt,reply_id, callback){
    mysql.update('insert into reply(content,author_id,article_id,create_at,update_at,reply_id) values(?,?,?,?,?,?)',[content, userId, articleId, createAt, createAt,reply_id], function(err, info){
        callback(err, info);
    });
};
/**
 * 删除回复
 */
exports.deleteReply = function(userId, replyId, callback){
    mysql.update('delete from reply where id = ? and author_id = ?',[ replyId, userId], function(err, info){
        callback(err, info);
    });
};

/**
 * 查询产品的最新评论信息
 */
exports.queryNewRepliesOfProduct = function(limit,callback) {
    mysql.query('select * from product_reply  order by create_at limit ?',[limit], function(err, replies) {
        callback(err, replies);
    });
};

/**
 * 根据产品id查询产品的评论信息
 */
exports.queryRepliesOfProduct = function(articleId, callback) {
    mysql.query('select * from product_reply where article_id = ? ', [ articleId ], function(err, replies) {
        callback(err, replies);
    });
};

/**
 * 根据产品id删除所有评论信息
 */
exports.deleteRepliesOfProduct = function(articleId, callback){
    mysql.update('delete from product_reply where article_id = ?', [ articleId], function(err, info) {
        callback(err, info);
    });
};

/**
 * 前台创建产品回复
 */
exports.saveProductReply = function(content, userId, articleId, createAt,user_info, callback){
    mysql.update('insert into product_reply(content,author_id,article_id,create_at,update_at,user_info) values(?,?,?,?,?,?)',[content, userId, articleId, createAt, createAt,user_info], function(err, info){
        callback(err, info);
    });
};
/**
 * 后台产品回复
 */
exports.saveProductReply2 = function(content, userId, articleId, createAt,reply_id, callback){
    mysql.update('insert into product_reply(content,author_id,article_id,create_at,update_at,reply_id) values(?,?,?,?,?,?)',[content, userId, articleId, createAt, createAt,reply_id], function(err, info){
        callback(err, info);
    });
};
/**
 * 删除产品回复
 */
exports.deleteProductReply = function(userId, replyId, callback){
    mysql.update('delete from product_reply where id = ? and author_id = ?',[ replyId, userId], function(err, info){
        callback(err, info);
    });
};




