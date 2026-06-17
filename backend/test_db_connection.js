const db = require('./src/db');

async function test() {
  try {
    const [rows] = await db.query('SELECT DATABASE() AS db');
    console.log('OK', rows);
  } catch (err) {
    console.error('ERROR', err.message);
  } finally {
    process.exit(0);
  }
}

test();
