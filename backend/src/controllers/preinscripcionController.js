const Preinscripcion = require('../models/preinscripcionModel');

async function list(req, res) {
  try {
    const rows = await Preinscripcion.getAllPreinscripciones();
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener preinscripciones' });
  }
}

module.exports = { list };
