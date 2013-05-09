var async = require('async');
var mysql = require('../lib/mysql.js');
var Util = require('../lib/util.js');
/**
 * 查询所有
 */
exports.queryConfig = function(callback){
    mysql.query('select * from site_config  where id =1',function(err, config){
        callback(err, config);
    });
};
/**
 * 编辑更新
 */
exports.updateConfig = function(content, callback){
    mysql.update('update site_config set  shop_config = ? where id =1' ,[content], function(err, info) {
       callback(err, info);
    });
};


