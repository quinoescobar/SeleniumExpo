var express = require('express');
var router = express.Router();
var tempController = require('../controllers/tempController');

/* GET home page. */
// router.get('/', function(req, res, next) {
//   res.render('index', { title: 'Express' });
// });
router.get('/', tempController.index);
router.get('/conversor/temperatura', tempController.conversorTemperatura);
router.get('/conversor/temperatura/convertir', tempController.convertir);

module.exports = router;
