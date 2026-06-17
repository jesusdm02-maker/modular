import React from 'react'
import PreinscripcionesList from '../components/PreinscripcionesList'

export default function PreinscripcionesPage(){
  return (
    <div className="page-content">
      <div className="page-header">
        <h2>Preinscripciones</h2>
        <p>Revisa los registros de preinscripción y su estado.</p>
      </div>
      <div className="table-card">
        <PreinscripcionesList />
      </div>
    </div>
  )
}
