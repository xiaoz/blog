var site_ctrl = require('./controller/site.js');


exports = module.exports = function(app) {
    // 首页
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
	
	

};
