import React from 'react'
import { NavLink } from 'react-router-dom'

export default function Sidebar(){
  return (
    <aside className="sidebar">
      <div className="sidebar-brand">
        <span>Sistema<br/>Inscripciones</span>
      </div>
      <nav className="sidebar-nav">
        <NavLink end to="/" className={({ isActive }) => isActive ? 'active' : ''}>
          Dashboard
        </NavLink>
        <NavLink to="/alumnos" className={({ isActive }) => isActive ? 'active' : ''}>
          Alumnos
        </NavLink>
        <NavLink to="/representantes" className={({ isActive }) => isActive ? 'active' : ''}>
          Representantes
        </NavLink>
        <NavLink to="/preinscripciones" className={({ isActive }) => isActive ? 'active' : ''}>
          Preinscripciones
        </NavLink>
      </nav>
    </aside>
  )
}
