import React, { useEffect, useState } from 'react'
import { fetchAlumnos } from '../services/api'

export default function AlumnosList(){
  const [alumnos,setAlumnos] = useState([])
  const [loading,setLoading] = useState(true)

  useEffect(()=>{
    fetchAlumnos().then(data=>{
      setAlumnos(data)
      setLoading(false)
    }).catch(()=>setLoading(false))
  },[])

  if(loading) return <div>Cargando alumnos...</div>

  return (
    <div>
      <h2>Alumnos</h2>
      <table border="1" cellPadding="6">
        <thead>
          <tr><th>ID</th><th>Nombre</th><th>Apellidos</th><th>Representante</th></tr>
        </thead>
        <tbody>
          {alumnos.map(a=> (
            <tr key={a.id_alumno}>
              <td>{a.id_alumno}</td>
              <td>{a.nombres}</td>
              <td>{a.apellidos}</td>
              <td>{a.representante}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
