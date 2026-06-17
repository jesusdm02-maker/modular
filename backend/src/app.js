const express = require('express');
const cors = require('cors');

const alumnoRoutes = require('./routes/alumnoRoutes');

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/alumnos', alumnoRoutes);

app.get('/api/health', (req, res) => res.json({ status: 'ok' }));

module.exports = app;
