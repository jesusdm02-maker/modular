const db = require('../db');

async function getAllRepresentantes() {
  const [rows] = await db.query(
    `SELECT r.id_representante, r.cedula, r.nombre_completo, r.parentesco,
      d.municipio, d.calle, d.avenida, t.numero_telefono
     FROM representantes r
     LEFT JOIN direccion d ON r.id_direccion = d.id_direccion
     LEFT JOIN telefono t ON r.id_telefono = t.id_telefono`
  );
  return rows;
}

module.exports = { getAllRepresentantes };
