const Dashboard = require('../models/dashboardModel');

async function summary(req, res) {
  try {
    const stats = await Dashboard.getSummary();
    res.json(stats);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener resumen del dashboard' });
  }
}

module.exports = { summary };
