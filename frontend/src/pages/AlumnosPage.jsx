import React, { useEffect, useState } from 'react'
import { fetchAlumnosPage } from '../services/api'
import AlumnosList from '../components/AlumnosList'
import Pagination from '../components/Pagination'

export default function AlumnosPage(){
  const [alumnos, setAlumnos] = useState([])
  const [page, setPage] = useState(1)
  const [limit] = useState(8)
  const [total, setTotal] = useState(0)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    setLoading(true)
    fetchAlumnosPage(page, limit)
      .then(data => {
        setAlumnos(data.data)
        setTotal(data.total)
      })
      .catch(err => console.error(err))
      .finally(() => setLoading(false))
  }, [page, limit])

  const totalPages = Math.ceil(total / limit)

  return (
    <div className="page-content">
      <div className="page-header">
        <h2>Lista de Alumnos</h2>
        <p>Explora los alumnos registrados en la base de datos y navega por páginas.</p>
      </div>

      <div className="table-card">
        {loading ? (
          <p>Cargando alumnos...</p>
        ) : (
          <>
            <AlumnosList alumnos={alumnos} />
            <Pagination page={page} totalPages={totalPages} onPageChange={setPage} />
          </>
        )}
      </div>
    </div>
  )
}
