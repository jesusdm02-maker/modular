import React from 'react'
import DashboardSummary from '../components/DashboardSummary'
import HealthStatus from '../components/HealthStatus'

export default function DashboardPage(){
  return (
    <div className="page-content">
      <div className="dashboard-intro">
        <div>
          <h2>Resumen general</h2>
          <p>Monitorea la conexión del backend y el estado global de inscripciones.</p>
        </div>
      </div>

      <div className="card-grid">
        <DashboardSummary />
        <HealthStatus />
      </div>
    </div>
  )
}
