import axios from 'axios'

const API = axios.create({ baseURL: 'http://localhost:4000/api' })

export async function fetchAlumnos(){
  const res = await API.get('/alumnos')
  return res.data
}

export async function fetchAlumnosPage(page = 1, limit = 8){
  const res = await API.get('/alumnos', {
    params: { page, limit }
  })
  return res.data
}

export default API
