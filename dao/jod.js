var async = require('async');
var mysql = require('../lib/mysql.js');
var Util = require('../lib/util.js');

/**
 * 查询关于我们
 */
exports.queryJodInfo= function(callback){
    mysql.query('select * from jod_info  where id =1',function(err, config){
        callback(err, config);
    });
};
/**
 * 编辑更新关于我们
 */
exports.updateJodInfo = function(content, callback){
    mysql.update('update jod_info set  comtent = ? where id =1' ,[content], function(err, info) {
       callback(err, info);
    });
};
