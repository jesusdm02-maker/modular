const Alumno = require('../models/alumnoModel');

async function list(req, res) {
  try {
    const page = parseInt(req.query.page, 10) || 1;
    const limit = parseInt(req.query.limit, 10) || 8;

    if (req.query.page || req.query.limit) {
      const [data, total] = await Promise.all([
        Alumno.getAlumnosPage(page, limit),
        Alumno.getAlumnosCount(),
      ]);
      return res.json({ page, limit, total, data });
    }

    const rows = await Alumno.getAllAlumnos();
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener alumnos' });
  }
}

module.exports = { list };
