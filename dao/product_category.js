var mysql = require('../lib/mysql.js');
var Util = require('../lib/util.js');

/**
 * 删除产品一级分类关系
 */
exports.deleteCategoriesOfProduct = function(articleId, callback) {
    mysql.update('delete from product_category where product_id = ?', [ articleId ], function(err, info) {
        callback(err, info);
    });
};

/**
 * 获取[产品-分类]关系
 */
exports.queryProductCategoryByCategory = function(categoryId, callback){
    mysql.query('select * from product_category where category_id = ?', [ categoryId ], function(err, kvs) {
        callback(err, kvs);
    });
};

/**
 * 获取[产品-二级分类]关系
 */
exports.queryProductCategoryByCategory = function(categoryId, callback){
    mysql.query('select * from product_category where category2_id = ?', [ categoryId ], function(err, kvs) {
        callback(err, kvs);
    });
};

/**
 * 获取[产品-分类]关系
 */
exports.queryProductCategoryByProduct = function(productId, callback){
    mysql.query('select * from product_category where product_id = ?', [ productId ], function(err, kvs) {
        callback(err, kvs);
    });
};