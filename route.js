var site_ctrl = require('./controller/site.js');
var sign_ctrl = require('./controller/sign.js');
var user_ctrl = require('./controller/user/user.js');
var message_ctrl = require('./controller/message/message.js');

var dashboard_ctrl = require('./controller/dashboard.js');

exports = module.exports = function(app) {
    // 前台相关首页
    app.get('/', site_ctrl.index);
	// 关于我们
	app.get('/about', site_ctrl.about);
	// 产品展示
	app.get('/product', site_ctrl.product);
	// 新闻 blog
	app.get('/news', site_ctrl.news);
	//客户案例
	app.get('/cases', site_ctrl.cases);
	// 联系我们
	app.get('/contact', site_ctrl.contact);
	
	
	// 后台注册登录相关
    app.get('/signup', sign_ctrl.signup);
    app.get('/signin', sign_ctrl.signin);
    app.get('/signout', sign_ctrl.signout);
    app.post('/signup', sign_ctrl.signup);
    app.post('/signin', sign_ctrl.signin);
    
    // 用户相关
    app.get('/user/:id', user_ctrl.index);
    app.get('/avatar', user_ctrl.getAvatar);
    app.post('/avatar/update', user_ctrl.updateAvatar);
    app.get('/pwd', user_ctrl.userPwd);
    app.post('/pwd/update', user_ctrl.updatePwd);
    app.get('/users', user_ctrl.users);
    app.post('/positive_users', user_ctrl.positiveUsers);
    
    // message相关
    app.post('/messages/unread', message_ctrl.unread_message_count);
    app.get('/messages', message_ctrl.view_messages);
    app.get('/messages/mark_all_read', message_ctrl.mark_all_read);
    
    //后台首页
    app.get('/index', dashboard_ctrl.index);
    //焦点图相关
	app.get('/focus/index', dashboard_ctrl.focus_index);
	app.get('/focus/add', dashboard_ctrl.focus_add);
	app.post('/focus/add', dashboard_ctrl.focus_add);
	app.post('/focus/upload', dashboard_ctrl.focus_upload);
    
};


