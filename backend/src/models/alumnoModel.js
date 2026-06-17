const db = require('../db');

async function getAllAlumnos() {
  const [rows] = await db.query(
    `SELECT a.id_alumno, a.nombres, a.apellidos, a.fecha_nacimiento, r.nombre_completo as representante
     FROM alumno a
     LEFT JOIN representantes r ON a.id_representante = r.id_representante`
  );
  return rows;
}

async function getAlumnosCount() {
  const [rows] = await db.query('SELECT COUNT(*) AS total FROM alumno');
  return rows[0].total || 0;
}

async function getAlumnosPage(page = 1, limit = 8) {
  const offset = (page - 1) * limit;
  const [rows] = await db.query(
    `SELECT a.id_alumno, a.nombres, a.apellidos, a.fecha_nacimiento, r.nombre_completo as representante
     FROM alumno a
     LEFT JOIN representantes r ON a.id_representante = r.id_representante
     ORDER BY a.id_alumno ASC
     LIMIT ? OFFSET ?`,
    [limit, offset]
  );
  return rows;
}

module.exports = { getAllAlumnos, getAlumnosCount, getAlumnosPage };
