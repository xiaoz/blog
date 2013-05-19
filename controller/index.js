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

var siteconfigDao = require('../dao/siteconfig.js');
var jodDao = require('../dao/jod.js');
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
		res.render('index', {
			current: 'index',
			active :'site'
        });
};

 //网站基本配置
exports.siteconfig = function(req, res, next) {
	var method = req.method.toLowerCase();
    if (method == 'get') {
    	siteconfigDao.queryConfig(function(err,config){
    		if (err){
    			res.render('siteconfig/add', {
        			current: 'index',
        			active :'siteconfig',
        			error : err
        	    });
    			return ;
    		}
			if(config[0].shop_config != ''){
				o = JSON.parse(config[0].shop_config);
			}else{
				 o.site_name = '公司名称';
    	 		 o.keyword = '购物';
    	 		 o.content = '我们是';
    	 		 o.qq = 'http://';
   	 		 	 o.sina = 'http://';
			}
    		
    		res.render('siteconfig/add', {
    			current: 'index',
    			active :'siteconfig',
    			o : o
    	    });
    	});
    }else{
    	 var site_name = sanitize(req.body.site_name).trim();
    	 var keyword = sanitize(req.body.keyword).trim();
    	 var content = sanitize(req.body.content).trim();
    	 var qq = req.body.qq;
    	 var sina = req.body.sina;
    	 
    	 var o = {};
    	 o.site_name = site_name;
    	 o.keyword = keyword;
    	 o.content = content;
    	 o.qq = qq;
		 o.sina = sina;
         if (site_name == '' || keyword == '' || content == '') {
             res.render('siteconfig/add', {
                 error : '信息不完整。填写完整有助于SEO',
                 current: 'index',
     			 active :'siteconfig',
     			 o : o
             });
             return;
         }
    	var box = JSON.stringify(o);
    	siteconfigDao.updateConfig(box,function(err,info){
    		if (err){
    			res.render('siteconfig/add', {
        			current: 'index',
        			active :'siteconfig',
        			error : err
        	    });
    			 return ;
    		}
    		res.render('siteconfig/add', {
    			 current: 'index',
     			 active :'siteconfig',
                 success : '成功 保存!',
                 o : o
              });
    	})
    	
    }
};
//公司相关消息
exports.companyinfo = function(req, res, next) {
	var method = req.method.toLowerCase();
    if (method == 'get') {
    	siteconfigDao.queryCompanyInfo(function(err,config){
    		if (err){
    			res.render('company_info/add', {
        			current: 'index',
        			active :'company_info',
        			error : err
        	    });
    			return ;
    		}
    		
			if(config[0].company_info != ''){
				o = JSON.parse(config[0].company_info);
			}else{
				var o = {};
    	 		o.title = '24小时服务，联系我们我们支持你';
    	 		o.address = 'Los Angeles, USA, 45896';
				o.tel = '+1 568 247 15 44';
				o.phone = '+1 568 354 78 25';
				o.email = 'info@elephantweb.com';
			}
			res.render('company_info/add', {
    			current: 'index',
    			active :'company_info',
    			o : o,
    			content:config[0].contact_detail
    	    });
    		
    	});
    }else{
    	 var title = req.body.title;
    	 var address = req.body.address;
    	 var content = req.body.content;
		 var tel = req.body.tel;
		 var phone = req.body.phone;
		 var email = sanitize(req.body.email).trim();
    	 var o = {};
    	 o.title = title;
    	 o.address = address;
    	 o.tel = tel;o.phone = phone;o.email = email;
         if (title == '' || address == '' || tel == '' || phone == ''|| email == '') {
             res.render('company_info/add', {
                 error : '信息不完整。',
                 current: 'index',
     			 active :'company_info',
     			 o : o,
     			 content:content
             });
             return;
         }
    	var box = JSON.stringify(o);
    	siteconfigDao.updateCompanyInfo(box,content,function(err,info){
    		if (err){
    			res.render('company_info/add', {
        			current: 'index',
        			active :'company_info',
        			error : err
        	    });
    			 return ;
    		}
    		res.render('company_info/add', {
    			 current: 'index',
     			 active :'company_info',
                 success : '成功 保存!',
                 o : o,
                 content:content
              });
    	})
    	
    }
};
//关于我们消息
exports.aboutinfo = function(req, res, next) {
	var method = req.method.toLowerCase();
    if (method == 'get') {
    	siteconfigDao.queryAboutInfo(function(err,config){
    		if (err){
    			res.render('about_info/add', {
        			current: 'index',
        			active :'about_info',
        			error : err
        	    });
    			return ;
    		}
			if(config[0].about_info != ''){
				o = JSON.parse(config[0].about_info);
			}else{
				var o = {};
    	 		o.title = '关于我们公司';
    	 		o.content1 = '目标描述1';
    	 		o.content1_1 = '阶段1描述';
    	 		o.content1_2 = '阶段2描述';
    	 		o.content1_3 = '阶段3描述';
    	 		o.content2_1 = '服务1描述';
    	 		o.content2_2 = '服务2描述';
    	 		o.content2_3 = '服务3描述';
    	 		o.content2_4 = '服务4描述';
			}
			res.render('about_info/add', {
    			current: 'index',
    			active :'about_info',
    			o : o,
    			content:config[0].about_detail
    	    });
    		
    	});
    }else{
    	 var title = req.body.title;
    	 var content = req.body.content;
    	 var content1 = (req.body.content1).trim();
    	 var content1_1 = (req.body.content1_1).trim();
    	 var content1_2 = (req.body.content1_2).trim();
    	 var content1_3 = (req.body.content1_3).trim();
    	 var content2_1 = (req.body.content2_1).trim();
    	 var content2_2 = (req.body.content2_2).trim();
    	 var content2_3 = (req.body.content2_3).trim();
    	 var content2_4 = (req.body.content2_4).trim();
    	 var o = {};
    	  	o.title = title;
    	  	o.content1 = content1;
    	  	o.content1_1 = content1_1;
    	  	o.content1_2 = content1_2;
    	  	o.content1_3 = content1_3;
    	  	o.content2_1 = content2_1;
    	  	o.content2_2 = content2_2;
    	  	o.content2_3 = content2_3;
    	  	o.content2_4 = content2_4;
         if (title == '' || content1 == '' || content2_1 == '' || content1_1 == '') {
             res.render('about_info/add', {
                 error : '信息不完整。',
                 current: 'index',
     			 active :'about_info',
     			 o : o,
     			 content:content
             });
             return;
         }
        var box = JSON.stringify(o);
    	siteconfigDao.updateAboutInfo(box,content,function(err,info){
    		if (err){
    			res.render('about_info/add', {
        			current: 'index',
        			active :'about_info',
        			error : err
        	    });
    			 return ;
    		}
    		res.render('about_info/add', {
    			 current: 'index',
     			 active :'about_info',
                 success : '成功 保存!',
                 o : o,
                 content:content
              });
    	})
    	
    }
};

//工作消息
exports.jodinfo = function(req, res, next) {
	var method = req.method.toLowerCase();
    if (method == 'get') {
    	jodDao.queryJodInfo(function(err,config){
    		if (err){
    			res.render('jod_info/add', {
        			current: 'index',
        			active :'jod_info',
        			error : err
        	    });
    			return ;
    		}
			res.render('jod_info/add', {
    			current: 'index',
    			active :'jod_info',
    			content : config[0].comtent
    	    });
    		
    	});
    }else{
    	 var content = req.body.content;
         if (content == '') {
             res.render('jod_info/add', {
                 error : '信息不完整。',
                 current: 'index',
     			 active :'jod_info'
             });
             return;
         }
    	jodDao.updateJodInfo(content,function(err,info){
    		if (err){
    			res.render('jod_info/add', {
        			current: 'index',
        			active :'jod_info',
        			error : err
        	    });
    			 return ;
    		}
    		res.render('jod_info/add', {
    			 current: 'index',
     			 active :'jod_info',
                 success : '成功 保存!',
                 content : content
              });
    	})
    }
};

//首页 焦点图管理
exports.focus_index = function(req, res, next) {
	 if(req.query.id){
		 focusDao.deleteFocus(req.query.id, function(err, info) {
	            if (err)
	                return next(err);
	            
	            focusDao.queryAllFocus(function(err, focus) {
		            if (err)
		                return next(err);
		            res.render('focus/index', {
		            	 current: 'index',
		            	 active: 'focus_index',
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
	            	 current: 'index',
	            	 active: 'focus_index',
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
    					 	current: 'index',
    					 	active: 'focus_add',
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
    				  current: 'index',
    				  active: 'focus_add'
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
        if (title == '' || url == '') {
            res.render('focus/add', {
                error : '信息不完整。',
                current: 'index',
                active: 'focus_add',
                title : title,
                link : link,
				url : url,
				content:content
            });
            return;
        }
//		try {
//            check(link, '链接地址不正确。。').isUrl();
//        }
//        catch (e) {
//			 res.render('focus/add', {
//                error : e.message,
//                current: 'index',
//                active: 'focus_add',
//                title : title,
//                link : link,
//				url : url,
//				content:content
//            });
//            return;
//        }
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
                	  current: 'index',
                	  active: 'focus_add',
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
