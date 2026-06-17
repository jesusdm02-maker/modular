import React from 'react'
import AlumnosList from './components/AlumnosList'

export default function App(){
  return (
    <div style={{padding:20,fontFamily:'Arial'}}>
      <h1>Dashboard - Sistema de Inscripciones</h1>
      <AlumnosList />
    </div>
  )
}
