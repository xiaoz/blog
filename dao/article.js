var mysql = require('../lib/mysql.js');
var Util = require('../lib/util.js');

/**
 * 根据文章id查询文章
 */
exports.queryArticle = function(articleId, callback) {
    mysql.queryOne('select id,title,tag,content,visit_count,reply_count,author_id,DATE_FORMAT(update_at,"%Y-%m-%d %H:%i:%s") as update_at,DATE_FORMAT(create_at,"%Y-%m-%d %H:%i:%s") as create_at from article where id = ?', [ articleId ], function(err,
            article) {
        callback(err, article);
    });
};

/**
 * 查询用户的所有文章
 */
exports.queryArticlesOfUser = function(userId,start,page_size, callback) {
    mysql.query('select id,title,tag,content,visit_count,reply_count,author_id,DATE_FORMAT(update_at,"%Y-%m-%d %H:%i:%s") as update_at,DATE_FORMAT(create_at,"%Y-%m-%d %H:%i:%s") as create_at  from article where author_id = ? order by update_at desc limit ? ,?',
            [ userId , start,page_size], function(err, articles) {
                callback(err, articles);
            });
};
/**
 * 查询用户的所有文章总数
 */
exports.queryArticlesOfUserTotal = function(userId, callback) {
    mysql.query('select count(*) as total  from article where author_id = ? ',
            [ userId ], function(err, total) {
                callback(err, total);
            });
};


/**
 * 查询用户某分类下的所有文章
 */
exports.queryArticlesOfUserCategory = function(userId, categoryId,start,page_size, callback) {
    mysql.query('select  id,title,tag,content,visit_count,reply_count,author_id,DATE_FORMAT(update_at,"%Y-%m-%d %H:%i:%s") as update_at,DATE_FORMAT(create_at,"%Y-%m-%d %H:%i:%s") as create_at  from article where author_id = ? and id in (select article_id from article_category where category_id = ?) order by update_at desc limit ? ,?',
                    [ userId, categoryId , start,page_size], function(err, articles) {
                        callback(err, articles);
                    });
};

/**
 * 查询用户某分类下的所有文章总数
 */
exports.queryArticlesOfUserCategoryTotal = function(userId, categoryId, callback) {
    mysql.query('select  count(*) as total  from article where author_id = ? and id in (select article_id from article_category where category_id = ?)',
            [ userId ,categoryId], function(err, total) {
                callback(err, total);
            });
};
/**
 * 更新文章查看数据
 */
exports.updateVisitCountOfArticle = function(articleId, callback) {
    mysql.update('update article set visit_count = visit_count + 1 where id = ? ', [ articleId ], function(err, info) {
        callback(err, info);
    });
};

/**
 * 更新文章回复数据
 */
exports.updateReplyCountOfArticle = function(articleId, isAdd, callback) {
    var operation = (isAdd ? '+' : '-');
    mysql.update('update article set reply_count = reply_count' + operation + '1 where id = ?', [ articleId ], function(err, info) {
        callback(err, info);
    });
};

/**
 * 创建文章
 */
exports.saveArticle = function(title, content, userId, insertDate,tags, callback) {
    mysql.update('insert into article(title,content,author_id,create_at,update_at,tag) values(?,?,?,?,?,?)', [ title, content, userId, insertDate, insertDate,tags ], function(err, info) {
        callback(err, info);
    });
};

/**
 * 重新编辑文章
 */
exports.updateArticle = function(title, content, updateDate, article_id, tag,callback) {
    mysql.update('update article set title = ?, content = ?,tag = ?, update_at = ? where id = ?', [ title, content, tag,updateDate, article_id ], function(err, info) {
        callback(err, info);
    });
};

/**
 * 删除文章
 */
exports.deleteArticle = function(articleId, authorId, callback) {
    mysql.update('delete from article where id = ? and author_id = ?', [ articleId, authorId ], function(err, info) {
        callback(err, info);
    });
};


/**
 * 查询最新新闻
 */
exports.queryNewArticle = function(limit, callback){
    mysql.query('select id,title,content,tag,visit_count,reply_count,author_id,DATE_FORMAT(update_at,"%Y-%m-%d %H:%i:%s") as update_at,DATE_FORMAT(create_at,"%Y-%m-%d %H:%i:%s") as create_at from article  where author_id = 1 order by id desc limit ?', [ limit ], function(err, articles) {
        callback(err, articles);
    });
};
