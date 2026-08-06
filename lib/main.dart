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

  double nilaiStok() {
    return harga * stok;
  }

  bool bisaDijual(int diminta) {
    return stok >= diminta;
  }

  void tampilkan() {
    print("===== DATA BARANG =====");
    print("Nama       : $nama");
    print("Harga      : Rp$harga");
    print("Stok       : $stok");
    print("Kategori   : $kategori");
    print("Nilai Stok : Rp${nilaiStok()}");
    print("=======================");
  }
}

// Definisi Class Pembeli
class Pembeli {
  String nama;
  bool statusAnggota;

  Pembeli(
    this.nama,
    this.statusAnggota,
  );

  void tampilkan() {
    print("===== DATA PEMBELI =====");
    print("Nama   : $nama");
    if (statusAnggota) {
      print("Status : Anggota");
    } else {
      print("Status : Umum");
    }
    print("========================");
  }
}

void main() {
  Barang buku = Barang(
    "Buku Tulis",
    3000,
    20,
    "ATK",
  );

  Pembeli pembeli = Pembeli(
    "Andi",
    true,
  );

  pembeli.tampilkan();
  buku.tampilkan();

  int jumlah = 5;

  print("");
  print("===== TRANSAKSI =====");
  print("${pembeli.nama} membeli $jumlah ${buku.nama}");

  if (buku.bisaDijual(jumlah)) {
    print("Transaksi berhasil");
  } else {
    print("Stok tidak mencukupi");
  }

  runApp(MyApp(
    buku: buku,
    pembeli: pembeli,
    jumlah: jumlah,
  ));
}

class MyApp extends StatelessWidget {
  final Barang buku;
  final Pembeli pembeli;
  final int jumlah;

  const MyApp({
    super.key,
    required this.buku,
    required this.pembeli,
    required this.jumlah,
  });

  @override
  Widget build(BuildContext context) {
    bool statusTransaksi = buku.bisaDijual(jumlah);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas RPL-12.2-5S3 — HOTS-3 (Relasi Pembeli & Barang)'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const Text(
                "Simulasi Transaksi Koperasi",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              // Card Data Pembeli
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "DATA PEMBELI",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      const Divider(),
                      Text("Nama   : ${pembeli.nama}"),
                      Text("Status : ${pembeli.statusAnggota ? 'Anggota' : 'Umum'}"),
                    ],
                  ),
                ),
              ),
              // Card Data Barang
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "DATA BARANG",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      const Divider(),
                      Text("Nama       : ${buku.nama}"),
                      Text("Harga      : Rp${buku.harga}"),
                      Text("Stok       : ${buku.stok}"),
                      Text("Kategori   : ${buku.kategori}"),
                      Text("Nilai Stok : Rp${buku.nilaiStok()}"),
                    ],
                  ),
                ),
              ),
              // Card Simulasi Transaksi
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "TRANSAKSI",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      const Divider(),
                      Text("${pembeli.nama} membeli $jumlah ${buku.nama}"),
                      const SizedBox(height: 5),
                      Text(
                        statusTransaksi
                            ? "Status : Transaksi berhasil"
                            : "Status : Stok tidak mencukupi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: statusTransaksi ? Colors.green : Colors.red,
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

// Relasi yang wajar antara Pembeli dan Barang adalah association (asosiasi),
// yaitu Pembeli melakukan transaksi untuk membeli Barang. Satu pembeli dapat
// membeli banyak barang, dan satu jenis barang dapat dibeli oleh banyak
// pembeli pada transaksi yang berbeda. Oleh karena itu, kedua objek saling
// berhubungan melalui proses transaksi, tetapi masing-masing tetap dapat
// berdiri sendiri.