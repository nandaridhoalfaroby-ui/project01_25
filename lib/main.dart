import 'package:flutter/material.dart';

// Definisi Class dengan Enkapsulasi
class Barang {
  String nama;
  double harga;
  int _stok; // Variabel private menggunakan underscore (_)
  String kategori;

  Barang(
    this.nama,
    this.harga,
    this._stok,
    this.kategori,
  );

  // Getter untuk membaca nilai _stok dari luar class tanpa bisa mengubahnya langsung
  int get stok {
    return _stok;
  }

  // Method jual untuk mengubah stok secara aman dengan validasi
  bool jual(int n) {
    if (_stok >= n) {
      _stok -= n;
      return true;
    }
    return false;
  }

  void tampilkan() {
    print("====================");
    print("Nama     : $nama");
    print("Harga    : Rp$harga");
    print("Stok     : $stok");
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

  print("=== SEBELUM PENJUALAN ===");
  buku.tampilkan();
  print("");

  int jumlahBeli = 5;
  bool statusPenjualan = buku.jual(jumlahBeli);

  if (statusPenjualan) {
    print("Penjualan berhasil");
  } else {
    print("Stok tidak cukup");
  }

  print("");
  print("=== SESUDAH PENJUALAN ===");
  buku.tampilkan();

  runApp(MyApp(
    buku: buku,
    jumlahBeli: jumlahBeli,
    statusPenjualan: statusPenjualan,
  ));
}

class MyApp extends StatelessWidget {
  final Barang buku;
  final int jumlahBeli;
  final bool statusPenjualan;

  const MyApp({
    super.key,
    required this.buku,
    required this.jumlahBeli,
    required this.statusPenjualan,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas RPL-12.2-603 — Enkapsulasi'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const Text(
                "Simulasi Enkapsulasi & Penjualan Barang",
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
                        "STATUS PENJUALAN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      const Divider(),
                      Text("Nama Barang : ${buku.nama}"),
                      Text("Harga       : Rp${buku.harga}"),
                      Text("Jumlah Beli : $jumlahBeli"),
                      const SizedBox(height: 5),
                      Text(
                        statusPenjualan
                            ? "Status      : Penjualan berhasil"
                            : "Status      : Stok tidak cukup",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: statusPenjualan ? Colors.green : Colors.red,
                          fontSize: 15,
                        ),
                      ),
                      const Divider(),
                      Text(
                        "Sisa Stok   : ${buku.stok}",
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

// Melindungi variabel _stok penting untuk menjaga integritas data koperasi
// karena stok tidak dapat diubah secara langsung dari luar class. Perubahan
// stok hanya dapat dilakukan melalui method jual(), sehingga setiap transaksi
// dapat divalidasi terlebih dahulu agar stok tidak menjadi negatif atau tidak
// sesuai dengan kondisi sebenarnya.