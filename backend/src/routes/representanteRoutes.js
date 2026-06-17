const express = require('express');
const router = express.Router();
const representanteController = require('../controllers/representanteController');

router.get('/', representanteController.list);

module.exports = router;
