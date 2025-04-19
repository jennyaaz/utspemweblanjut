const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

// Inisialisasi Express
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());  
app.use(cors()); 

// Koneksi ke Database MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', 
  database: 'minuman_umkm',  
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database: ', err.stack);
    return;
  }
  console.log('Connected to the database');
});

// Validasi Middleware
function validateProduct(req, res, next) {
  console.log(req.body);  
  const { nama, harga } = req.body;

  if (!nama || nama.length < 3) {
    return res.status(400).json({ error: 'Nama minuman harus lebih dari 3 karakter' });
  }
  if (harga <= 0) {
    return res.status(400).json({ error: 'Harga harus lebih dari 0' });
  }
  next();
}

// Endpoint CRUD untuk Produk (Minuman)

// Get semua minuman
app.get('/api/minuman', (req, res) => {
  db.query('SELECT * FROM minuman', (err, results) => {
    if (err) {
      return res.status(500).json({ error: 'Database error' });
    }
    res.json(results);  
  });
});

// Get minuman berdasarkan ID
app.get('/api/minuman/:id', (req, res) => {
  const { id } = req.params;
  db.query('SELECT * FROM minuman WHERE id = ?', [id], (err, results) => {
    if (err) {
      return res.status(500).json({ error: 'Database error' });
    }
    if (results.length === 0) {
      return res.status(404).json({ error: 'Minuman tidak ditemukan' });
    }
    res.json(results[0]);  
  });
});

// Tambah minuman
app.post('/api/minuman', validateProduct, (req, res) => {
  const { nama, kategori, harga } = req.body;
  db.query('INSERT INTO minuman (nama, kategori, harga) VALUES (?, ?, ?)', [nama, kategori, harga], (err, results) => {
    if (err) {
      return res.status(500).json({ error: 'Database error' });
    }
    res.status(201).json({ message: 'Minuman berhasil ditambahkan', id: results.insertId });
  });
});

// Update minuman
app.put('/api/minuman/:id', validateProduct, (req, res) => {
  const { id } = req.params;
  const { nama, kategori, harga } = req.body;
  db.query('UPDATE minuman SET nama = ?, kategori = ?, harga = ? WHERE id = ?', [nama, kategori, harga, id], (err, results) => {
    if (err) {
      return res.status(500).json({ error: 'Database error' });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ error: 'Minuman tidak ditemukan' });
    }
    res.json({ message: 'Minuman berhasil diperbarui' });
  });
});

// Hapus minuman
app.delete('/api/minuman/:id', (req, res) => {
  const { id } = req.params;
  db.query('DELETE FROM minuman WHERE id = ?', [id], (err, results) => {
    if (err) {
      return res.status(500).json({ error: 'Database error' });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ error: 'Minuman tidak ditemukan' });
    }
    res.json({ message: 'Minuman berhasil dihapus' });
  });
});

// Menjalankan Server
app.listen(PORT, () => {
  console.log(`Server berjalan di port ${PORT}`);
});
