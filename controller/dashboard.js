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

exports.focus_add = function(req, res, next) {
    
        res.render('focus/add', {
			current: 'focus_add'
        	
        });
  
};

