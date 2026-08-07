import 'package:flutter/material.dart';

// Definisi Class Barang dengan Enkapsulasi
class Barang {
  String nama;
  double harga;
  int _stok;
  String kategori;

  Barang(
    this.nama,
    this.harga,
    this._stok,
    this.kategori,
  );

  int get stok => _stok;

  bool jual(int jumlah) {
    if (_stok >= jumlah) {
      _stok -= jumlah;
      return true;
    }
    return false;
  }
}

// Fungsi prosesBeli dengan Exception Handling (try-catch-finally)
void prosesBeli(
  Barang barang,
  String inputJumlah,
) {
  try {
    int jumlah = int.parse(inputJumlah);

    if (barang.jual(jumlah)) {
      print("Penjualan berhasil.");
      print("Jumlah dibeli : $jumlah");
      print("Sisa stok : ${barang.stok}");
    } else {
      print("Stok tidak mencukupi.");
    }
  } catch (e) {
    print("Input tidak valid.");
    print("Silakan masukkan jumlah berupa angka.");
  } finally {
    print("Transaksi dicatat di log.");
  }
}

void main() {
  Barang buku = Barang(
    "Buku Tulis",
    3000,
    20,
    "ATK",
  );

  print("===== UJI 1 =====");
  prosesBeli(buku, "2");

  print("");

  print("===== UJI 2 =====");
  prosesBeli(buku, "dua");

  runApp(MyApp(
    buku: buku,
  ));
}

class MyApp extends StatelessWidget {
  final Barang buku;

  const MyApp({
    super.key,
    required this.buku,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas RPL-12.2-703 — Uji dan Justifikasi'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const Text(
                "Tabel G : Pengujian Exception Handling",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "HASIL UJI COBA PROGRAM",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      const Divider(),
                      const Text("1. Uji prosesBeli(\"2\")"),
                      const Text("   - Status: Penjualan berhasil, stok berkurang"),
                      const Text("   - Tetap Berjalan: ✅ Ya (Sesuai aturan)"),
                      const SizedBox(height: 10),
                      const Text("2. Uji prosesBeli(\"dua\")"),
                      const Text("   - Status: Muncul pesan input tidak valid"),
                      const Text("   - Tetap Berjalan: ✅ Ya (Ditangani catch)"),
                      const Divider(),
                      Text(
                        "Sisa Stok Akhir : ${buku.stok}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Penanganan galat meningkatkan kepercayaan pengurus pada sistem karena
// kesalahan input tidak menyebabkan program berhenti. Sistem memberikan
// pesan yang jelas kepada petugas untuk memperbaiki input sehingga data
// transaksi tetap aman, akurat, dan aplikasi menjadi lebih andal digunakan.