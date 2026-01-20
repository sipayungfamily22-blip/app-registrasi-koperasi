from koperasi_apps.database import db
from datetime import datetime
from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash

class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password_hash = db.Column(db.String(256))
    role = db.Column(db.String(20), default='user')  # user, approval1, approval2, admin
    is_active = db.Column(db.Boolean, default=True)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    def set_password(self, password):
        self.password_hash = generate_password_hash(password)
    
    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

class Pendaftaran(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    # Data pribadi
    nama_lengkap = db.Column(db.String(200), nullable=False)
    tempat_lahir = db.Column(db.String(100), nullable=False)
    tanggal_lahir = db.Column(db.Date, nullable=False)
    alamat_rumah = db.Column(db.Text, nullable=False)
    nomor_handphone = db.Column(db.String(20), nullable=False)
    alamat_email = db.Column(db.String(120), nullable=False)
    nomor_ktp = db.Column(db.String(20), nullable=False)
    no_id_karyawan = db.Column(db.String(50), nullable=False)
    asal_departemen = db.Column(db.String(100), nullable=False)
    nomor_rekening = db.Column(db.String(50), nullable=False)
    nama_bank = db.Column(db.String(100), nullable=False)
    
    # File upload paths
    upload_ktp = db.Column(db.String(255))
    upload_id_karyawan = db.Column(db.String(255))
    upload_pas_foto = db.Column(db.String(255))
    upload_buku_tabungan = db.Column(db.String(255))
    
    # Status approval
    status = db.Column(db.String(20), default='pending')  # pending, approved1, approved2, rejected, cancelled
    approval1_by = db.Column(db.Integer, db.ForeignKey('user.id'))
    approval1_at = db.Column(db.DateTime)
    approval1_notes = db.Column(db.Text)
    approval2_by = db.Column(db.Integer, db.ForeignKey('user.id'))
    approval2_at = db.Column(db.DateTime)
    approval2_notes = db.Column(db.Text)
    
    # Pernyataan
    pernyataan_disetujui = db.Column(db.Boolean, default=False)
    
    # Timestamps
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    
    def __repr__(self):
        return f'<Pendaftaran {self.nama_lengkap}>'
    
    # Relationships
    approval1_user = db.relationship('User', foreign_keys=[approval1_by])
    approval2_user = db.relationship('User', foreign_keys=[approval2_by])

class Dokter(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nama_dokter = db.Column(db.String(200), nullable=False)
    spesialisasi = db.Column(db.String(100))
    nomor_kontak = db.Column(db.String(20), nullable=False)
    alamat_praktik = db.Column(db.Text)
    jumlah_kupon = db.Column(db.Integer, default=0)
    kupon_awal = db.Column(db.Integer, default=0)  # Initial kupon before period
    periode_berlaku_bulan = db.Column(db.String(10))  # Format: YYYY-MM, e.g. 2026-01
    keterangan = db.Column(db.Text)
    is_active = db.Column(db.Boolean, default=True)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    
    def __repr__(self):
        return f'<Dokter {self.nama_dokter}>'

class PenggunaanKupon(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    dokter_id = db.Column(db.Integer, db.ForeignKey('dokter.id'), nullable=False)
    user_email = db.Column(db.String(120), nullable=False)
    jumlah_kupon_digunakan = db.Column(db.Integer, default=1)
    catatan = db.Column(db.Text)
    tanggal_penggunaan = db.Column(db.DateTime, default=datetime.utcnow)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    # Relationship
    dokter = db.relationship('Dokter', backref='penggunaan_kupon')
    
    def __repr__(self):
        return f'<PenggunaanKupon {self.user_email} - {self.dokter.nama_dokter}>'