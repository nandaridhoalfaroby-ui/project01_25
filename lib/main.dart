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
  List<Barang> daftarBarang = [
    Barang("Buku Tulis", 3000, 20, "ATK"),
    Barang("Pulpen", 2500, 15, "ATK"),
    Barang("Roti", 5000, 10, "Makanan"),
  ];

  for (Barang barang in daftarBarang) {
    barang.tampilkan();
  }

  runApp(MyApp(daftarBarang: daftarBarang));
}

class MyApp extends StatelessWidget {
  final List<Barang> daftarBarang;

  const MyApp({
    super.key,
    required this.daftarBarang,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas RPL-12.2-5S1 — HOTS-1 (Nilai Stok)'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const Text(
                "Daftar Barang & Nilai Stok",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              ...daftarBarang.map((barang) => Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama      : ${barang.nama}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text("Harga     : Rp${barang.harga}"),
                          Text("Stok      : ${barang.stok}"),
                          Text("Kategori  : ${barang.kategori}"),
                          const Divider(),
                          Text(
                            "Nilai Stok: Rp${barang.nilaiStok()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// Nilai stok berguna untuk mengetahui total nilai persediaan setiap barang.
// Informasi ini membantu koperasi menghitung aset yang dimiliki, membuat
// laporan keuangan, serta menentukan kapan harus menambah stok barang.