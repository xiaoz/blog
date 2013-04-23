var async = require('async');
var mysql = require('../lib/mysql.js');
var Util = require('../lib/util.js');
/**
 * 查询所有焦点图
 */
exports.queryAllFocus = function(callback){
    mysql.query('select * from focus',function(err, focus){
        callback(err, focus);
    });
};
/**
 * 保存 焦点图
 */
exports.saveFocus = function(title, link, sort, createAt, url,content, callback){
    mysql.update('insert into focus(title,link,sort,create_at,url,content) values(?,?,?,?,?,?)', [ title, link, sort, createAt, url,content ], function(err, info) {
       callback(err, info);
    });
};
/**
 * 编辑
 */
exports.updateFocus = function(userId, avatar, callback){
    mysql.update('update userBlog set avatar = ? where id = ?', [avatar, userId], function(err, info){
        callback(err, info);
    }); 
};

