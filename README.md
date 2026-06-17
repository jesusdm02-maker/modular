# modular

Proyecto 'sistema inscripciones' - dashboard mínimo

Backend:
- Ruta principal: `backend/src/server.js`
- Variables de entorno: `backend/.env.example`
- Instalar dependencias y ejecutar:

```bash
cd backend
npm install
npm run dev   # o npm start
```

Frontend (Vite + React):
```bash
cd frontend
npm install
npm run start
```

Notas:
- Asegúrate de importar `Base de datos/sistemainscripciones.sql` en tu MariaDB antes de ejecutar el backend.
- Endpoints disponibles: `GET /api/alumnos`.
