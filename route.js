var site_ctrl = require('./controller/site.js');
var sign_ctrl = require('./controller/sign.js');
var user_ctrl = require('./controller/user/user.js');
var message_ctrl = require('./controller/message/message.js');

var category_ctrl = require('./controller/blog/category.js');
var article_ctrl = require('./controller/blog/article.js');
var reply_ctrl = require('./controller/blog/reply.js');
var upload_ctrl = require('./controller/blog/upload.js');
var folder_ctrl = require('./controller/vdisk/folder.js');
var file_ctrl = require('./controller/vdisk/file.js');



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
    // sidebar
    app.post('/userinfo/category/:user_id', user_ctrl.getUserCategories);
    app.post('/userinfo/folder', user_ctrl.getUserFolders);
	
	
    // message相关
    app.post('/messages/unread', message_ctrl.unread_message_count);
    app.get('/messages', message_ctrl.view_messages);
    app.get('/messages/mark_all_read', message_ctrl.mark_all_read);
	
	// 文章分类相关
    app.get('/categories/edit', category_ctrl.editCategories);
    app.get('/category/:category_id/edit', category_ctrl.editCategory);
    app.post('/category/:category_id/modify', category_ctrl.modifyCategory);
    app.post('/category/add', category_ctrl.addCategory);
    app.get('/category/:category_id/delete', category_ctrl.deleteCategory);
	
	 // 文章相关
    app.get('/article/create', article_ctrl.createArticle);
    app.post('/article/create', article_ctrl.createArticle);
    app.get('/article/:article_id/edit', article_ctrl.editArticle);
    app.post('/article/:article_id/modify', article_ctrl.modifyArticle);
    app.get('/article/:article_id/delete', article_ctrl.deleteArticle);
    app.get('/articles/:user_id/:category_id', article_ctrl.viewArticlesOfUserCategory);
    app.get('/:user_id/articles', article_ctrl.viewArticlesOfUser);
    app.get('/article/:article_id', article_ctrl.viewArticle);
	
	// reply
    app.post('/:article_id/reply', reply_ctrl.createReply);
    app.post('/reply/:reply_id/delete', reply_ctrl.deleteReply);

    // 上传图片
    app.post('/upload/image', upload_ctrl.upload_image);
	
	// folder相关
    app.get('/folders/edit', folder_ctrl.editFolders);
    app.get('/folder/:folder_id/edit', folder_ctrl.editFolder);
    app.post('/folder/:folder_id/modify', folder_ctrl.modifyFolder);
    app.post('/folder/add', folder_ctrl.addFolder);
    app.get('/folder/:folder_id/delete', folder_ctrl.deleteFolder);

    // file相关
    app.post('/file/upload', file_ctrl.uploadFile);
    app.get('/file/upload', file_ctrl.uploadFile);
    app.post('/file/add', file_ctrl.addFile);
    app.get('/:folder_id/files', file_ctrl.viewFilesOfFolder);
    app.post('/file/:file_id/private', file_ctrl.set_file_private);
    app.post('/file/:file_id/public', file_ctrl.set_file_public);
    app.post('/file/:file_id/delete', file_ctrl.deleteFile);
    app.get('/file/:file_id', file_ctrl.viewFile);
    app.post('/file/:file_id/tofolder/:folder_id', file_ctrl.change_file_folder);
    app.get('/:user_id/files/share', file_ctrl.user_share_files);
    app.get('/file/:file_id/download', file_ctrl.downloadFile);
    app.get('/files', file_ctrl.files);
    
    //后台首页
    app.get('/index', dashboard_ctrl.index);
    //焦点图相关
	app.get('/focus/index', dashboard_ctrl.focus_index);
	app.get('/focus/add', dashboard_ctrl.focus_add);
	app.post('/focus/add', dashboard_ctrl.focus_add);
	app.post('/focus/upload', dashboard_ctrl.focus_upload);
	
	
    
};


