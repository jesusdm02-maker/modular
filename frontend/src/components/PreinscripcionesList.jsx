import React, { useEffect, useState } from 'react'
import api from '../services/api'

export default function PreinscripcionesList(){
  const [items, setItems] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    api.get('/preinscripciones')
      .then(response => setItems(response.data))
      .catch(err => console.error(err))
      .finally(() => setLoading(false))
  }, [])

  if (loading) return <div>Cargando preinscripciones...</div>

  return (
    <div>
      <table className="styled-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Alumno</th>
            <th>Grado</th>
            <th>Período</th>
            <th>Usuario</th>
          </tr>
        </thead>
        <tbody>
          {items.map(i => (
            <tr key={i.id_preinscripcion}>
              <td>{i.id_preinscripcion}</td>
              <td>{i.alumno}</td>
              <td>{i.nombre_grado}</td>
              <td>{i.periodo}</td>
              <td>{i.usuario}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
