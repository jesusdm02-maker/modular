const Alumno = require('../models/alumnoModel');

async function list(req, res) {
  try {
    const rows = await Alumno.getAllAlumnos();
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener alumnos' });
  }
}

module.exports = { list };
