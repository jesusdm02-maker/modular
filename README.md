# modular

Proyecto 'sistema inscripciones' - dashboard mínimo

## Estructura del proyecto

- `backend/` - API REST en Node.js con Express usando arquitectura MVC:
  - `routes/` define las rutas
  - `controllers/` gestiona la lógica de respuesta
  - `models/` ejecuta consultas SQL sobre la base de datos
- `frontend/` - Aplicación React con Vite:
  - `src/components/` contiene las vistas del dashboard
  - `src/services/api.js` actúa como capa de acceso a datos REST

## Requisitos

- Node.js y npm instalados
- MariaDB / MySQL con la base de datos `sistemainscripciones`
- Importar `Base de datos/sistemainscripciones.sql` antes de ejecutar el servidor

## Backend

```bash
cd backend
npm install
cp .env.example .env
# ajustar DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE si hace falta
npm run dev
```

El servidor se ejecuta en `http://localhost:4000`.

### Endpoints disponibles

- `GET /api/health`
- `GET /api/alumnos`
- `GET /api/representantes`
- `GET /api/preinscripciones`
- `GET /api/dashboard/summary`

## Frontend

```bash
cd frontend
npm install
npm run dev
```

La app de React se servirá en `http://localhost:5173`.

## Notas adicionales

- El backend usa `dotenv` para variables de entorno.
- El frontend consume la API en `http://localhost:4000/api`.
- Si necesitas modificar la base de datos, actualiza primero el script SQL y vuelve a importar.
