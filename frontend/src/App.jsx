import React from 'react'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Sidebar from './components/Sidebar'
import DashboardPage from './pages/DashboardPage'
import AlumnosPage from './pages/AlumnosPage'
import RepresentantesPage from './pages/RepresentantesPage'
import PreinscripcionesPage from './pages/PreinscripcionesPage'

export default function App(){
  return (
    <BrowserRouter>
      <div className="app-shell">
        <Sidebar />
        <main className="main-content">
          <Routes>
            <Route path="/" element={<DashboardPage />} />
            <Route path="/alumnos" element={<AlumnosPage />} />
            <Route path="/representantes" element={<RepresentantesPage />} />
            <Route path="/preinscripciones" element={<PreinscripcionesPage />} />
          </Routes>
        </main>
      </div>
    </BrowserRouter>
  )
}
