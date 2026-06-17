import React, { useEffect, useState } from 'react'
import api from '../services/api'

export default function HealthStatus() {
  const [health, setHealth] = useState(null)
  const [error, setError] = useState(null)

  useEffect(() => {
    api.get('/health')
      .then(response => setHealth(response.data))
      .catch(err => setError(err.response?.data?.error || err.message))
  }, [])

  if (error) {
    return (
      <div className="health-card health-error">
        <h3>Estado de conexión</h3>
        <p>Fallo al conectar con el backend o la base de datos.</p>
        <pre>{error}</pre>
      </div>
    )
  }

  if (!health) {
    return (
      <div className="health-card health-loading">
        <h3>Estado de conexión</h3>
        <p>Cargando...</p>
      </div>
    )
  }

  return (
    <div className={`health-card ${health.connected ? 'health-ok' : 'health-error'}`}>
      <h3>Estado de conexión</h3>
      <p>{health.connected ? 'Conectado al backend y base de datos' : 'No conectado'}</p>
      <div className="health-details">
        <span className={health.connected ? 'dot ok' : 'dot error'}></span>
        <strong>{health.connected ? 'DB:' : 'Error:'}</strong>
        <span>{health.connected ? health.database : error}</span>
      </div>
    </div>
  )
}
