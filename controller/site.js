var async = require('async');
var mysql = require('../lib/mysql.js');
var Util = require('../lib/util.js');
var userDao = require('../dao/user.js');

/**
 * 网站首页主体数据
 */
exports.index = function(req, res, next) {
    
        res.render('front/index', {
        });
  
};
/**
 * 网站首页主体数据
 */
exports.about = function(req, res, next) {
    
    res.render('front/about', {
    });

};
/**
 * 网站首页关于我们
 */
exports.product = function(req, res, next) {
    
    res.render('front/product', {
    });

};
/**
 * 网站首页产品展示
 */
exports.news = function(req, res, next) {
    
    res.render('front/news', {
    });

};
/**
 * 网站首页客户案例
 */
exports.cases = function(req, res, next) {
    
    res.render('front/cases', {
    });

};
/**
 * 网站首页联系我们
 */
exports.contact = function(req, res, next) {
    
    res.render('front/contact', {
    });

};

