import React, { useEffect, useState } from 'react'
import api from '../services/api'

export default function RepresentantesList(){
  const [representantes, setRepresentantes] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    api.get('/representantes')
      .then(response => setRepresentantes(response.data))
      .catch(err => console.error(err))
      .finally(() => setLoading(false))
  }, [])

  if (loading) return <div>Cargando representantes...</div>

  return (
    <div>
      <table className="styled-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Cédula</th>
            <th>Nombre</th>
            <th>Parentesco</th>
            <th>Dirección</th>
            <th>Teléfono</th>
          </tr>
        </thead>
        <tbody>
          {representantes.map(r => (
            <tr key={r.id_representante}>
              <td>{r.id_representante}</td>
              <td>{r.cedula}</td>
              <td>{r.nombre_completo}</td>
              <td>{r.parentesco}</td>
              <td>{`${r.municipio || ''} ${r.calle || ''} ${r.avenida || ''}`.trim()}</td>
              <td>{r.numero_telefono}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
