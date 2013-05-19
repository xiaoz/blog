var async = require('async');
var sanitize = require('validator').sanitize;
var categoryDao = require('../../dao/product_categorys.js');
var articleCategoryDao = require('../../dao/product_category.js');

/**
 * 点击编辑所有分类
 */
exports.editCategories = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
        	current	: 'product',
			active	: 'user_index',
            error : '你还没有登录。'
        });
        return;
    }
    categoryDao.queryCategoriesOfUser(req.session.user.id, function(err, categories){
        if(err || !categories){
            res.render('product/category/edit_all', {
            	current	: 'product',
    			active	: 'user_index',
                categories : []
            });
            return;
        }
        else{
            res.render('product/category/edit_all', {
            	current	: 'product',
    			active	: 'user_index',
                categories : categories
            });
            return;
        }
    });
};

/**
 * 点击一个分类进行编辑
 */
exports.editCategory = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
        	current	: 'product',
			active	: 'user_index',
            error : '你还没有登录。'
        });
        return;
    }

    var user_id = req.session.user.id;
    var category_id = req.params.category_id;

    categoryDao.queryCategory(category_id, function(err, category){
        if(err){
            res.render('product/category/edit', {
                category : {},
                categories : []
            });
            return;
        }
        else{
            categoryDao.queryCategoriesOfUser(user_id, function(err,categories){
                if(err || !categories){
                    res.render('product/category/edit', {
                    	current	: 'product',
            			active	: 'user_index',
                        category : {},
                        categories : []
                    });
                    return;
                }
                else{
                    res.render('product/category/edit', {
                    	current	: 'product',
            			active	: 'user_index',
                        category : category,
                        categories : categories
                    });
                    return;
                }
            });
        }
    });  
};

/**
 * 修改一个分类
 */
exports.modifyCategory = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
            error : '你还没有登录。'
        });
        return;
    }

    var user_id = req.session.user.id;
    var category_id = req.params.category_id;

    async.parallel({// 并行执行
        categories : function(cb){
            categoryDao.queryCategoriesOfUser(user_id,function(err,categories){
                if(err || !categories){
                    cb(null,[]);
                }
                else{
                    cb(null,categories);
                }
            });
        },
        info : function(cb) {// 编辑分类
            var name = sanitize(req.body.name).trim();
            name = sanitize(name).xss();
            var sequence = req.body.sequence;
            categoryDao.updateCategory(name, sequence, user_id, category_id, function(err, info) {
                if (err) {
                    res.render('notify/notify', {
                    	current	: 'product',
            			active	: 'user_index',
                        error : '修改产品分类发生错误'
                    });
                    return;
                }
                cb(null, info);
            });
        },

    }, function(err, data) {// 并行完成后最终执行
        if (err) {
            res.render('notify/notify', {
            	current	: 'product',
    			active	: 'user_index',
                error : '修改分类出错'
            });
            return;
        }
        else{
            res.render('product/category/edit_all', {
            	current	: 'product',
    			active	: 'user_index',
                categories : data.categories
            });
            return;
        }
    });
};

/**
 * 添加一个产品分类
 */
exports.addCategory = function(req, res, next) {
    if (!req.session || !req.session.user) {
        res.render('notify/notify', {
            error : '你还没有登录。'
        });
        return;
    }

    var name = sanitize(req.body.name).trim();
    name = sanitize(name).xss();
    var sequence = req.body.sequence;

    if (name == '') {
        res.render('notify/notify', {
        	current	: 'product',
			active	: 'user_index',
            error : '信息不完整。'
        });
        return;
    }
    categoryDao.saveCategory(name, sequence, req.session.user.id, function(err, info) {
        if (err) {
            res.render('notify/notify', {
            	current	: 'product',
    			active	: 'user_index',
                error : '添加分类出错'
            });
            return;
        }
        res.redirect('/product/categories/edit');
    });
};
/**
 * 删除一个产品分类
 */
exports.deleteCategory = function(req, res, next) {
    if (!req.session || !req.session.user) {
        res.render('notify/notify', {
            error : '你还没有登录。'
        });
        return;
    }

    var user_id = req.session.user.id;
    var category_id = req.params.category_id;

    articleCategoryDao.queryProductCategoryByCategory( category_id , function(err, kvs) {
        if (err) {
            res.render('notify/notify', {
            	current	: 'product',
    			active	: 'user_index',
                error : '删除分类时解除产品关系出错'
            });
            return;
        }
        if (kvs && kvs.length > 0) {
            res.render('notify/notify', {
            	current	: 'product',
    			active	: 'user_index',
                error : ' 删除分类时请先把该分类下产品移到其它分类下'
            });
            return;
        }
        categoryDao.deleteCategory(user_id, category_id,  function(err, info) {
            if (err) {
                res.render('notify/notify', {
                	current	: 'product',
        			active	: 'user_index',
                    error : '删除分类出错'
                });
                return;
            }
            category2Dao.deleteCategoryOfParent(user_id, category_id,  function(err, info) {
                if (err) {
                    res.render('notify/notify', {
                    	current	: 'product',
            			active	: 'user_index',
                        error : '删除二级分类出错'
                    });
                    return;
                }
                res.redirect('/product/categories/edit');
            });
        });
    });
};


var category2Dao = require('../../dao/product_categorys2.js');

/**
 * 点击一个分类进行二次分类的编辑
 */
exports.editAllCategory2 = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
        	current	: 'product',
			active	: 'user_index',
            error : '你还没有登录。'
        });
        return;
    }

    var user_id = req.session.user.id;
    var category_id = req.params.category_id;

    categoryDao.queryCategory(category_id, function(err, category){
        if(err){
            res.render('product/category/edit2', {
                category : {},
                categories : []
            });
            return;
        }
        else{
        	category2Dao.queryCategory(category_id, function(err,categories){
                if(err || !categories){
                    res.render('product/category/editall2', {
                    	current	: 'product',
            			active	: 'user_index',
                        category : {},
                        categories : []
                    });
                    return;
                }
                else{
                    res.render('product/category/editall2', {
                    	current	: 'product',
            			active	: 'user_index',
                        category : category,
                        categories : categories
                    });
                    return;
                }
            });
        }
    });  
};
/**
 * 点击一个二级分类进行编辑
 */
exports.editCategory2 = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
        	current	: 'product',
			active	: 'user_index',
            error : '你还没有登录。'
        });
        return;
    }
    var user_id = req.session.user.id;
    var category_id = req.params.category_id;
    var category1_id = req.query.category1_id;
    category2Dao.queryOneCategory(category_id, function(err, category){
        if(err){
            res.render('product/category/edit', {
                category : {},
                categories : []
            });
            return;
        }
        else{
            category2Dao.queryCategory(category1_id, function(err,categories){
                if(err || !categories){
                    res.render('product/category/edit2', {
                    	current	: 'product',
            			active	: 'user_index',
                        category : {},
                        categories : [],
                        category1_id:category1_id
                    });
                    return;
                }
                else{
                    res.render('product/category/edit2', {
                    	current	: 'product',
            			active	: 'user_index',
                        category : category,
                        categories : categories,
                        category1_id :category1_id
                    });
                    return;
                }
            });
        }
    });  
};

/**
 * 修改一个分类
 */
exports.modifyCategory2 = function(req, res, next) {
    if (!req.session.user) {
        res.render('notify/notify', {
            error : '你还没有登录。'
        });
        return;
    }

    var user_id = req.session.user.id;
    var category_id = req.params.category_id;
    var category1_id = req.body.category1_id;
    async.parallel({// 并行执行
        categories : function(cb){
            category2Dao.queryCategory(category1_id,function(err,categories){
                if(err || !categories){
                    cb(null,[]);
                }
                else{
                    cb(null,categories);
                }
            });
        },
        category : function(cb){
        	categoryDao.queryCategory(category1_id, function(err, category){
                if(err){
                	cb(null,[]);
                } else{
                    cb(null,category);
                }
        	})
        },
        info : function(cb) {// 编辑分类
            var name = sanitize(req.body.name).trim();
            name = sanitize(name).xss();
            var sequence = req.body.sequence;
            category2Dao.updateCategory(name, sequence, user_id, category_id, function(err, info) {
                if (err) {
                    res.render('notify/notify', {
                    	current	: 'product',
            			active	: 'user_index',
                        error : '修改产品分类发生错误'
                    });
                    return;
                }
                cb(null, info);
            });
        }

    }, function(err, data) {// 并行完成后最终执行
        if (err) {
            res.render('notify/notify', {
            	current	: 'product',
    			active	: 'user_index',
                error : '修改分类出错'
            });
            return;
        }
        else{
            res.render('product/category/editall2', {
            	current	: 'product',
    			active	: 'user_index',
    			category : data.category,
                categories : data.categories
            });
            return;
            return;
        }
    });
};
/**
 * 添加一个产品二级分类
 */
exports.addCategory2 = function(req, res, next) {
    if (!req.session || !req.session.user) {
        res.render('notify/notify', {
            error : '你还没有登录。'
        });
        return;
    }

    var name = sanitize(req.body.name).trim();
    name = sanitize(name).xss();
    var sequence = req.body.sequence;

    if (name == '') {
        res.render('notify/notify', {
        	current	: 'product',
			active	: 'user_index',
            error : '信息不完整。'
        });
        return;
    }
    var category1_id = req.body.category1_id;
    category2Dao.saveCategory(name, sequence, req.session.user.id, category1_id ,function(err, info) {
        if (err) {
            res.render('notify/notify', {
            	current	: 'product',
    			active	: 'user_index',
                error : '添加分类出错'
            });
            return;
        }
        res.redirect('/product/category2/'+category1_id+'/editall');
    });
};
/**
 * 删除一个产品二级分类
 */
exports.deleteCategory2 = function(req, res, next) {
    if (!req.session || !req.session.user) {
        res.render('notify/notify', {
            error : '你还没有登录。'
        });
        return;
    }

    var user_id = req.session.user.id;
    var category_id = req.params.category_id;
    var category1_id = req.query.category1_id;

    articleCategoryDao.queryProductCategoryByCategory( category_id , function(err, kvs) {
        if (err) {
            res.render('notify/notify', {
            	current	: 'product',
    			active	: 'user_index',
                error : '删除分类时解除产品关系出错'
            });
            return;
        }
        if (kvs && kvs.length > 0) {
            res.render('notify/notify', {
            	current	: 'product',
    			active	: 'user_index',
                error : ' 删除分类时请先把该分类下产品移到其它分类下'
            });
            return;
        }
        category2Dao.deleteCategory(user_id, category_id,  function(err, info) {
            if (err) {
                res.render('notify/notify', {
                	current	: 'product',
        			active	: 'user_index',
                    error : '删除分类出错'
                });
                return;
            }
            res.redirect('/product/category2/'+category1_id+'/editall');
        });
    });
};