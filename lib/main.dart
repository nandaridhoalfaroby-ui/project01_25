import 'package:flutter/material.dart';

// Definisi Class Barang
class Barang {
  String nama;
  double harga;
  int stok;
  String kategori;

  Barang(
    this.nama,
    this.harga,
    this.stok,
    this.kategori,
  );

  // Method untuk menghitung nilai stok
  double nilaiStok() {
    return harga * stok;
  }

  // Method baru untuk mengecek apakah barang bisa dijual berdasarkan permintaan
  bool bisaDijual(int diminta) {
    return stok >= diminta;
  }

  void tampilkan() {
    print("======================");
    print("Nama      : $nama");
    print("Harga     : Rp$harga");
    print("Stok      : $stok");
    print("Kategori  : $kategori");
    print("Nilai Stok: Rp${nilaiStok()}");
    print("======================");
  }
}

void main() {
  Barang buku = Barang(
    "Buku Tulis",
    3000,
    20,
    "ATK",
  );

  buku.tampilkan();

  int permintaan = 15;
  print("Permintaan : $permintaan");

  if (buku.bisaDijual(permintaan)) {
    print("Status : Barang bisa dijual");
  } else {
    print("Status : Stok tidak mencukupi");
  }

  runApp(MyApp(buku: buku, permintaan: permintaan));
}

class MyApp extends StatelessWidget {
  final Barang buku;
  final int permintaan;

  const MyApp({
    super.key,
    required this.buku,
    required this.permintaan,
  });

  @override
  Widget build(BuildContext context) {
    bool statusJual = buku.bisaDijual(permintaan);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas RPL-12.2-5S2 — HOTS-2 (bisaDijual)'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const Text(
                "Pengecekan Stok Penjualan",
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
                      Text(
                        "Nama      : ${buku.nama}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text("Harga     : Rp${buku.harga}"),
                      Text("Stok      : ${buku.stok}"),
                      Text("Kategori  : ${buku.kategori}"),
                      const Divider(),
                      Text("Permintaan : $permintaan"),
                      const SizedBox(height: 5),
                      Text(
                        statusJual
                            ? "Status : Barang bisa dijual"
                            : "Status : Stok tidak mencukupi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: statusJual ? Colors.green : Colors.red,
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

// Menaruh pengecekan stok di dalam objek Barang membuat setiap barang
// dapat memeriksa stoknya sendiri. Program menjadi lebih rapi, kode
// tidak perlu ditulis berulang, dan jika aturan penjualan berubah,
// cukup mengubah method bisaDijual() pada class Barang.