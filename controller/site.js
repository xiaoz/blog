var async = require('async');
var mysql = require('../lib/mysql.js');
var Util = require('../lib/util.js');
var userDao = require('../dao/user.js');

/**
 * 网站首页主体数据
 */
exports.index = function(req, res, next) {
    
        res.render('index', {
        });
  
};

