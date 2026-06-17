const db = require('../db');

async function getSummary() {
  const [rows] = await db.query(
    `SELECT
      (SELECT COUNT(*) FROM alumno) AS total_alumnos,
      (SELECT COUNT(*) FROM representantes) AS total_representantes,
      (SELECT COUNT(*) FROM preinscripciones) AS total_preinscripciones,
      (SELECT COUNT(*) FROM grados) AS total_grados,
      (SELECT COUNT(*) FROM usuarios) AS total_usuarios`
  );
  return rows[0] || {};
}

module.exports = { getSummary };
