


exports.index = function(req, res, next) {
  // debug("Yendo a  index.js:  '/'");
  res.render('index', { title: 'Conversor de Temperatura' });
};
