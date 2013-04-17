exports.config = {
	name : '彩虹铺',
	description : '彩虹铺 是基于Node.js开发的社区系统',
	host : 'http://127.0.0.1',
	session_secret : 'secret',
	auth_cookie_name : 'secret',
	app_port : 10080,
	version : '0.2.1',

	// log files directory
	logDirectory : __dirname + "/logs/",

	// mysql config
	server : "r2602binghua7.mysql.aliyun.com",
	port : 3306,
	user : "r8549binghua7",
	password : "r6081760d",
	database : "r8549binghua7",
	maxSockets : 80,//pool使用
	timeout : 1,//pool使用
	
	tmp_upload_path : '/home/tmp/uploads', //express的临时上传路径,需首先建立这个文件夹(在app.use(express.bodyParser({uploadDir:'/home/tmp/uploads'}));设置)
	avatar_path : '/user_data/avatar', //相对路径：用户自定义头像的上传地址，在/public下
	article_pic_path : '/user_data/images', //相对路径：文章中的图片的上传地址，在/public下
	vdisk_path :'/home/files', //绝对路径：网盘的默认主路径

};
