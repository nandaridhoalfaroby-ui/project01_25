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

  void tampilkan() {
    print("====================");
    print("Nama : $nama");
    print("Harga : Rp$harga");
    print("Stok : $stok");
    print("Kategori : $kategori");
    print("====================");
  }
}

void main() {
  Barang buku = Barang(
    "Buku Tulis",
    3000,
    20,
    "ATK",
  );

  Barang pulpen = Barang(
    "Pulpen",
    2500,
    15,
    "ATK",
  );

  Barang roti = Barang(
    "Roti",
    5000,
    10,
    "Makanan",
  );

  // Menyimpan objek ke dalam List<Barang>
  List<Barang> daftarBarang = [
    buku,
    pulpen,
    roti,
  ];

  // Menampilkan data menggunakan perulangan for
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
          title: const Text('Tugas RPL-12.2-503 — List (List<Barang>)'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const Text(
                "Daftar Barang Menggunakan List",
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
                            "Nama : ${barang.nama}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text("Harga : Rp${barang.harga}"),
                          Text("Stok : ${barang.stok}"),
                          Text("Kategori : ${barang.kategori}"),
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

// Menggunakan List<Barang> membuat program lebih rapi dan mudah dikembangkan.
// Jika jumlah barang bertambah, cukup menambahkan objek ke dalam list tanpa
// menulis pemanggilan tampilkan() satu per satu seperti pada cara sebelumnya.