import axios from 'axios'

const API = axios.create({ baseURL: 'http://localhost:4000/api' })

export async function fetchAlumnos(){
  const res = await API.get('/alumnos')
  return res.data
}
