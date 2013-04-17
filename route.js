var site_ctrl = require('./controller/site.js');


exports = module.exports = function(app) {// routes
    // 首页
    app.get('/', site_ctrl.index);

};
