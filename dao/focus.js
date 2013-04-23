var async = require('async');
var mysql = require('../lib/mysql.js');
var Util = require('../lib/util.js');
/**
 * 查询所有焦点图
 */
exports.queryAllFocus = function(callback){
    mysql.query('select * from focus where status = ?',['0'],function(err, focus){
        callback(err, focus);
    });
};

/**
 * 查询某个焦点图
 */
exports.queryFocusById = function(id,callback){
    mysql.query('select * from focus where id = ?',[id],function(err, info){
        callback(err, info);
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
 * 编辑更新
 */
exports.updateFocus = function(title, link, sort , url,content,id, callback){
    mysql.update('update focus set title = ? ,link = ?, sort= ? ,url = ? , content = ? where id = ?' ,[title,link,sort,url,content,id], function(err, info) {
       callback(err, info);
    });
};

/**
 * 删除
 */
exports.deleteFocus = function(id , callback){
    mysql.update('update focus set status = ? where id = ?', ['1', id], function(err, info){
        callback(err, info);
    }); 
};

