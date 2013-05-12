var async = require('async');
var mysql = require('../lib/mysql.js');
var Util = require('../lib/util.js');
/**
 * 查询网站基本配置
 */
exports.queryConfig = function(callback){
    mysql.query('select * from site_config  where id =1',function(err, config){
        callback(err, config);
    });
};
/**
 * 编辑更新网站基本配置
 */
exports.updateConfig = function(content, callback){
    mysql.update('update site_config set  shop_config = ? where id =1' ,[content], function(err, info) {
       callback(err, info);
    });
};

/**
 * 查询所有公司基本消息
 */
exports.queryCompanyInfo= function(callback){
    mysql.query('select * from site_config  where id =1',function(err, config){
        callback(err, config);
    });
};
/**
 * 编辑更新公司基本消息
 */
exports.updateCompanyInfo = function(content, callback){
    mysql.update('update site_config set  company_info = ? where id =1' ,[content], function(err, info) {
       callback(err, info);
    });
};
/**
 * 查询关于我们
 */
exports.queryAboutInfo= function(callback){
    mysql.query('select * from site_config  where id =1',function(err, config){
        callback(err, config);
    });
};
/**
 * 编辑更新关于我们
 */
exports.updateAboutInfo = function(content, callback){
    mysql.update('update site_config set  about_info = ? where id =1' ,[content], function(err, info) {
       callback(err, info);
    });
};
