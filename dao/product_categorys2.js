var mysql = require('../lib/mysql.js');
var Util = require('../lib/util.js');
var async = require('async');

/**
 * 查询某分类
 */
exports.queryOneCategory = function(categoryId, callback){
    mysql.queryOne('select * from product_categorys2 where id =?', [categoryId ], function(err, category) {
        callback(err, category);
    });
};
/**
 * 查询某父分类下的分类
 */
exports.queryCategory = function(categoryId, callback){
    mysql.query('select * from product_categorys2 where category1_id =?', [categoryId ], function(err, category) {
        callback(err, category);
    });
};

/**
 * 批量按父分类id查询产子分类
 */
exports.queryChildCategoriesOfCategories = function(categoryIds, callback){
    mysql.query('select * from product_categorys2 where category1_id in(' + categoryIds.join(',') + ') group by id', [], function(err, kvs) {
        callback(err, kvs);
    });
};

/**
 * 删除分类
 */
exports.deleteCategory = function(userId, categoryId, callback){
    mysql.update('delete from product_categorys2 where id=? and user_id=?', [ categoryId, userId ], function(err, info) {
        callback(err, info);
    });
};

/**
 * 根据父id 删除全部子分类
 */
exports.deleteCategoryOfParent = function(userId, categoryId, callback){
    mysql.update('delete from product_categorys2 where category1_id = ? and user_id=?', [ categoryId, userId ], function(err, info) {
        callback(err, info);
    });
};


/**
 * 根据产品id查询产品的所属category信息
 */
exports.queryCategoriesOfProduct = function(productId, callback) {
    mysql.query("select * from product_categorys where id in (select category_id from product_category where product_id=?)", [ productId ], function(err, categories) {
        callback(err, categories);
    });
};

/**
 * 得到用户的所有产品二级分类
 */
exports.queryCategoriesOfUser = function(userId, callback) {
    mysql.query('select * from product_categorys2 where user_id = ? order by sequence asc', [ userId ], function(err, categories) {
        callback(err, categories);
    });
};


/**
 * 批量按分类id查询产品总数
 */
exports.queryArticlesCountOfCategories = function(categoryIds, callback){
    mysql.query('select category2_id,count(product_id) as count from product_category where category2_id in(' + categoryIds.join(',') + ') group by category2_id', [], function(err, kvs) {
        callback(err, kvs);
    });
};

/**
 * 更新分类
 */
exports.updateCategory = function(name, sequence, userId, categoryId, callback) {
    mysql.update('update product_categorys2 set name=?, sequence=? where user_id = ? and id = ?', [ name, sequence, userId, categoryId ], function(err, info) {
        callback(err, info);
    });
};

/**
 * 保存产品分类
 */
exports.saveCategory = function(name, sequence, userId,category1_id, callback) {
    mysql.update('insert into product_categorys2(name,sequence,user_id,category1_id) values(?,?,?,?)', [ name, sequence, userId,category1_id ], function(err, info) {
        callback(err, info);
    });
};

/**
 * 保存产品分类
 */
exports.saveCategoriesOfArticle = function(articleId, categories, callback) {
    async.forEach(categories, function(category_item, cb) {
        mysql.update('insert into product_category(product_id, category_id) values(?,?)', [ articleId, category_item ], function(err, info) {
            if (err) {
                cb(err, info);
            }
            else {
                cb(null, null);
            }
        });
    }, function(err, categories) {
        callback(err, categories);
    });
};
