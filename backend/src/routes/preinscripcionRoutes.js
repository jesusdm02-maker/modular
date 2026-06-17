const express = require('express');
const router = express.Router();
const preinscripcionController = require('../controllers/preinscripcionController');

router.get('/', preinscripcionController.list);

module.exports = router;
