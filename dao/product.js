var mysql = require('../lib/mysql.js');
var Util = require('../lib/util.js');

/**
 * 根据产品id查询产品
 */
exports.queryArticle = function(productId, callback) {
    mysql.queryOne('select id,title,tag,content,visit_count,reply_count,author_id,DATE_FORMAT(update_at,"%Y-%m-%d %H:%i:%s") as update_at,DATE_FORMAT(create_at,"%Y-%m-%d %H:%i:%s") as create_at ,goods_img from product where id = ?', [ productId ], function(err,
            product) {
        callback(err, product);
    });
};

/**
 * 查询用户的所有产品
 */
exports.queryArticlesOfUser = function(userId,start,page_size, callback) {
    mysql.query('select id,title,tag,content,visit_count,reply_count,author_id,DATE_FORMAT(update_at,"%Y-%m-%d %H:%i:%s") as update_at,DATE_FORMAT(create_at,"%Y-%m-%d %H:%i:%s") as create_at ,goods_img  from product where author_id = ? order by update_at desc limit ? ,?',
            [ userId , start,page_size], function(err, products) {
                callback(err, products);
            });
};
/**
 * 查询用户的所有产品总数
 */
exports.queryArticlesOfUserTotal = function(userId, callback) {
    mysql.query('select count(*) as total  from product where author_id = ? ',
            [ userId ], function(err, total) {
                callback(err, total);
            });
};


/**
 * 查询用户某一级分类下的所有产品
 */
exports.queryArticlesOfUserCategory = function(userId, categoryId,start,page_size, callback) {
    mysql.query('select  id,title,tag,content,visit_count,reply_count,author_id,DATE_FORMAT(update_at,"%Y-%m-%d %H:%i:%s") as update_at,DATE_FORMAT(create_at,"%Y-%m-%d %H:%i:%s") as create_at ,goods_img from product where author_id = ? and id in (select product_id from product_category where category_id = ?) order by update_at desc limit ? ,?',
                    [ userId, categoryId , start,page_size], function(err, products) {
                        callback(err, products);
                    });
};

/**
 * 查询用户某一级分类下的所有产品总数
 */
exports.queryArticlesOfUserCategoryTotal = function(userId, categoryId, callback) {
    mysql.query('select  count(*) as total  from product where author_id = ? and id in (select product_id from product_category where category_id = ?)',
            [ userId ,categoryId], function(err, total) {
                callback(err, total);
            });
};
/**
 * 查询用户某二级分类下的所有产品
 */
exports.queryArticlesOfUserCategory2 = function(userId, categoryId,start,page_size, callback) {
    mysql.query('select  id,title,tag,content,visit_count,reply_count,author_id,DATE_FORMAT(update_at,"%Y-%m-%d %H:%i:%s") as update_at,DATE_FORMAT(create_at,"%Y-%m-%d %H:%i:%s") as create_at ,goods_img from product where author_id = ? and id in (select product_id from product_category where category2_id = ?) order by update_at desc limit ? ,?',
                    [ userId, categoryId , start,page_size], function(err, products) {
                        callback(err, products);
                    });
};

/**
 * 查询用户某二级分类下的所有产品总数
 */
exports.queryArticlesOfUserCategory2Total = function(userId, categoryId, callback) {
    mysql.query('select  count(*) as total  from product where author_id = ? and id in (select product_id from product_category where category2_id = ?)',
            [ userId ,categoryId], function(err, total) {
                callback(err, total);
            });
};
/**
 * 更新产品查看数据
 */
exports.updateVisitCountOfArticle = function(productId, callback) {
    mysql.update('update product set visit_count = visit_count + 1 where id = ? ', [ productId ], function(err, info) {
        callback(err, info);
    });
};

/**
 * 更新产品回复数据
 */
exports.updateReplyCountOfArticle = function(productId, isAdd, callback) {
    var operation = (isAdd ? '+' : '-');
    mysql.update('update product set reply_count = reply_count' + operation + '1 where id = ?', [ productId ], function(err, info) {
        callback(err, info);
    });
};

/**
 * 创建产品
 */
exports.saveArticle = function(title, content, userId, insertDate,goods_img,tags, callback) {
    mysql.update('insert into product(title,content,author_id,create_at,update_at,goods_img,tag) values(?,?,?,?,?,?,?)', [ title, content, userId, insertDate, insertDate,goods_img,tags], function(err, info) {
        callback(err, info);
    });
};

/**
 * 重新编辑产品
 */
exports.updateArticle = function(title, content, updateDate, goods_img, product_id,tags, callback) {
    mysql.update('update product set title = ?, content = ?, update_at = ? ,goods_img = ? ,tag = ? where id = ?', [ title, content, updateDate, goods_img,tags,product_id], function(err, info) {
        callback(err, info);
    });
};

/**
 * 删除产品
 */
exports.deleteArticle = function(productId, authorId, callback) {
    mysql.update('delete from product where id = ? and author_id = ?', [ productId, authorId ], function(err, info) {
        callback(err, info);
    });
};

/**
 * 查询最新新闻
 */
exports.queryNewProduct = function(limit, callback){
    mysql.query('select id,title,content,tag,visit_count,goods_img,reply_count,author_id,DATE_FORMAT(update_at,"%Y-%m-%d %H:%i:%s") as update_at,DATE_FORMAT(create_at,"%Y-%m-%d %H:%i:%s") as create_at from product  where author_id = 1 order by update_at desc limit ?', [ limit ], function(err, articles) {
        callback(err, articles);
    });
};
