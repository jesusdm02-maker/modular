import React from 'react'
import RepresentantesList from '../components/RepresentantesList'

export default function RepresentantesPage(){
  return (
    <div className="page-content">
      <div className="page-header">
        <h2>Representantes</h2>
        <p>Revisa los representantes vinculados a los alumnos registrados.</p>
      </div>
      <div className="table-card">
        <RepresentantesList />
      </div>
    </div>
  )
}
