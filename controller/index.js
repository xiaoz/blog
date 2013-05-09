var fs = require('fs');
var path = require('path');
var async = require('async');
var ndir = require('ndir');
var config = require('../config.js').config;
var log = require('../lib/log.js');

var common = require('./common/common.js');
var mod = require('express/node_modules/connect/node_modules/formidable');

var Util = require('../lib/util.js');
var check = require('validator').check;
var sanitize = require('validator').sanitize;
var focusDao = require('../dao/focus.js');

var path_prefix = config.article_pic_path;
var upload_path = path.join(path.dirname(__dirname), '/public' + path_prefix);
ndir.mkdir(upload_path, function(err) {
    if (err)
        throw err;
    mod.IncomingForm.UPLOAD_DIR = upload_path;
});

/**
 * 网站后台首页
 */
exports.index = function(req, res, next) {
		res.render('dashboard', {
			current: 'dashboard'
        });
};

exports.focus_index = function(req, res, next) {
	 if(req.query.id){
		 focusDao.deleteFocus(req.query.id, function(err, info) {
	            if (err)
	                return next(err);
	            
	            focusDao.queryAllFocus(function(err, focus) {
		            if (err)
		                return next(err);
		            res.render('focus/index', {
						current: 'focus_index',
						focus:focus,
						 success : '删除成功!'
			        });
		            return;
		        });
	        });
	 }else{
		 focusDao.queryAllFocus(function(err, focus) {
	            if (err)
	                return next(err);
	            res.render('focus/index', {
					current: 'focus_index',
					focus:focus
		        });
	            return;
	        });
	 }
       
};
// 增加焦点图 保存焦点图
exports.focus_add = function(req, res, next) {
	var method = req.method.toLowerCase();
	var focus_id = req.query.id;
    if (method == 'get') {
    		//编辑
    		if(focus_id){
    			focusDao.queryFocusById(focus_id,function(err,info){
    				 if (err)
    		                return next(err);
    				 res.render('focus/add', {
    						current: 'focus_add',
    						id : focus_id,
    		                title : info[0].title,
    		                link : info[0].link,
    						url : info[0].url,
    						sort :info[0].sort,
    						content:info[0].content
    		            });
    			})
    		}else{
    			  res.render('focus/add', {
    					current: 'focus_add'
    		        });
    		        return;
    		}
    	
      
    }
    if (method == 'post') {
        var title = sanitize(req.body.title).trim();
        title = sanitize(title).xss();
        var category = req.body.category || 0;
        var link = sanitize(req.body.link).trim();
        link = sanitize(link).xss();
		var url = sanitize(req.body.url).trim();
		var sort = sanitize(req.body.sort).trim();
        var content = sanitize(req.body.content).trim();
        content = sanitize(content).xss();
        if (title == '' || link == '' || url == '') {
            res.render('focus/add', {
                error : '信息不完整。',
				current: 'focus_add',
                title : title,
                link : link,
				url : url,
				content:content
            });
            return;
        }
		try {
            check(link, '链接地址不正确。。').isUrl();
        }
        catch (e) {
			 res.render('focus/add', {
                error : e.message,
				current: 'focus_add',
                title : title,
                link : link,
				url : url,
				content:content
            });
            return;
        }
        if(focus_id){
        	 focusDao.updateFocus(title, link, sort , url,content,focus_id , function(err, info) {
                 if (err)
                     return next(err);
                 res.redirect('/focus/index');
                 return;
             });
        }else{
        	  focusDao.saveFocus(title, link, sort, new Date() , url,content , function(err, info) {
                  if (err)
                      return next(err);
                  res.render('focus/add', {
      				current: 'focus_add',
                      success : '成功 保存!'
                  });
                  return;
              });
        }
      
    }
  
};
//上传焦点图
exports.focus_upload = function(req, res, next) {
     if (!req.session || !req.session.user) {
        res.render('notify/notify', { error : '登录后才可上传图片'});
        return;
    }

    var file = req.files.avatar;

    if (file) {
        var name = file.name;
        var ext = name.substr(name.lastIndexOf('.'), 4);
        var uid = req.session.user.id;
        var new_name = uid + new Date().getTime()+name;
        var new_path = path.join(upload_path, new_name);
        var img_path = path_prefix +'/'+ new_name;
        fs.rename(file.path, new_path, function(err) {
            if (err) {
                res.json({ state : 'failed'});
                return;
            }
            else{
                    res.json({
                        state : 'success',
                        url : img_path
                    });
                    return;
            }       
        });
    }
    else {
        res.json({
            state : 'failed'
        });
        return;
    }
};
