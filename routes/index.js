var express = require('express');
var router = express.Router();
var tempController = require('../controllers/tempController');

/* GET home page. */
// router.get('/', function(req, res, next) {
//   res.render('index', { title: 'Express' });
// });
router.get('/', tempController.index);

module.exports = router;
