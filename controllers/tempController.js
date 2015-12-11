// var Quiz = require('../models/quiz_model');
var Temp = require('../models/tempModel');
//var debug = require();


exports.index = function(req, res, next) {
  // debug("Yendo a  index.js:  '/'");
  res.render('index', { title: 'Conversor de Temperatura' });
};

exports.conversorTemperatura = function(req,res) {
  res.render('temperatura/index', {});
};

exports.convertir = function(req,res) {
  var ingresado = req.query.original;
  console.log("Ingresado "+ ingresado);
  var temp = new Temp(ingresado);
  var calcular = temp.calcular();
  res.render('temperatura/convertir', {result : calcular});
};
