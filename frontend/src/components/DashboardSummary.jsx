import React, { useEffect, useState } from 'react'
import api from '../services/api'

export default function DashboardSummary(){
  const [stats, setStats] = useState(null)

  useEffect(() => {
    api.get('/dashboard/summary')
      .then(response => setStats(response.data))
      .catch(err => console.error(err))
  }, [])

  if (!stats) return (
    <div className="dashboard-card">
      <h2>Resumen</h2>
      <p>Cargando resumen...</p>
    </div>
  )

  return (
    <div className="dashboard-card">
      <h2>Resumen</h2>
      <div className="stat-value">{stats.total_alumnos || 0}</div>
      <div className="stat-row">
        <Stat label="Representantes" value={stats.total_representantes} />
        <Stat label="Preinscripciones" value={stats.total_preinscripciones} />
      </div>
      <div className="stat-row">
        <Stat label="Grados" value={stats.total_grados} />
        <Stat label="Usuarios" value={stats.total_usuarios} />
      </div>
    </div>
  )
}

function Stat({ label, value }){
  return (
    <div className="small-stat">
      <span>{label}</span>
      <strong>{value ?? 0}</strong>
    </div>
  )
}
