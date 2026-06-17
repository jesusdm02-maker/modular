const db = require('../db');

async function getAllAlumnos() {
  const [rows] = await db.query(
    `SELECT a.id_alumno, a.nombres, a.apellidos, a.fecha_nacimiento, r.nombre_completo as representante
     FROM alumno a
     LEFT JOIN representantes r ON a.id_representante = r.id_representante`
  );
  return rows;
}

module.exports = { getAllAlumnos };
