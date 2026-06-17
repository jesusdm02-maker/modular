const Representante = require('../models/representanteModel');

async function list(req, res) {
  try {
    const rows = await Representante.getAllRepresentantes();
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener representantes' });
  }
}

module.exports = { list };
