const db = require('../db');

async function status(req, res) {
  try {
    const [rows] = await db.query('SELECT DATABASE() AS database_name');
    res.json({
      status: 'ok',
      database: rows[0].database_name || null,
      connected: true,
    });
  } catch (err) {
    console.error('DB health check failed:', err.message);
    res.status(503).json({
      status: 'error',
      connected: false,
      error: err.message,
    });
  }
}

module.exports = { status };
