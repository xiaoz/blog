var fs = require('fs');
var path = require('path');
var async = require('async');
var ndir = require('ndir');
var log = require('../lib/log.js');
var config = require('../config.js').config;
var common = require('./common/common.js');
var mod = require('express/node_modules/connect/node_modules/formidable');


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
    
        res.render('focus/index', {
			current: 'focus_index'
        	
        });
};
// 增加焦点图
exports.focus_add = function(req, res, next) {
    
        res.render('focus/add', {
			current: 'focus_add'
        });
  
};
//保存焦点图
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
        var new_name = uid + ext;
        var new_path = path.join(upload_path, new_name);
        var img_path = path_prefix +'/'+ new_name;
        console.log(new_path);
        console.log(path_prefix);
        console.log(img_path);
        fs.rename(file.path, new_path, function(err) {
            if (err) {
                res.json({ state : 'failed'});
                return;
            }
            else{
                	//userDao.updateAvatar( req.session.user.id, img_path, function(err, info){
                    res.json({
                        state : 'success',
                        url : img_path
                    });
                    return;
//                }); 
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

