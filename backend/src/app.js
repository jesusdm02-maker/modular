const express = require('express');
const cors = require('cors');

const alumnoRoutes = require('./routes/alumnoRoutes');
const representanteRoutes = require('./routes/representanteRoutes');
const preinscripcionRoutes = require('./routes/preinscripcionRoutes');
const dashboardRoutes = require('./routes/dashboardRoutes');
const healthRoutes = require('./routes/healthRoutes');

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/alumnos', alumnoRoutes);
app.use('/api/representantes', representanteRoutes);
app.use('/api/preinscripciones', preinscripcionRoutes);
app.use('/api/dashboard', dashboardRoutes);
app.use('/api/health', healthRoutes);

module.exports = app;
