const db = require('../db');

async function getAllPreinscripciones() {
  const [rows] = await db.query(
    `SELECT p.id_preinscripcion,
      CONCAT(a.nombres, ' ', a.apellidos) AS alumno,
      g.nombre_grado,
      per.año_inicio AS periodo,
      u.nombre AS usuario
     FROM preinscripciones p
     LEFT JOIN alumno a ON p.id_alumno = a.id_alumno
     LEFT JOIN r_g_p rgp ON p.id_r_g_p = rgp.id_r_g_p
     LEFT JOIN grados g ON rgp.id_grado = g.id_grado
     LEFT JOIN periodo per ON rgp.id_periodo = per.id_periodo
     LEFT JOIN user u ON p.id_user = u.id_user`
  );
  return rows;
}

module.exports = { getAllPreinscripciones };
