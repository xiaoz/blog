var mysql = require('../lib/mysql.js');
var Util = require('../lib/util.js');

/**
 * 删除产品分类关系
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
    mysql.query('select * from product_category where product_id = ?', [ categoryId ], function(err, kvs) {
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