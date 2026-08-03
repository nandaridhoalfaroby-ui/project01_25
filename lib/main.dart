import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  // Format mata uang Rupiah
  final NumberFormat rupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  // ==========================
  // RPL-12.2-204 (PENGUJIAN SKENARIO)
  // Ubah variabel di bawah ini sesuai skenario yang ingin diuji:
  // Skenario 1: bool anggota = true, hargaAnggota = 5000, jumlahBeli = 50, kategori = "makanan"
  // Skenario 2: bool anggota = false, hargaUmum = 6000, jumlahBeli = 25, kategori = "makanan"
  // Skenario 3: bool anggota = false, hargaUmum = 5000, jumlahBeli = 10, kategori = "makanan"
  // ==========================
  bool anggota = true;
  double hargaAnggota = 5000;
  double hargaUmum = 6000;
  int jumlahBeli = 50;
  String namaBarang = "Buku Tulis";
  String kategori = "makanan";

  int hargaSatuan;
  if (anggota) {
    hargaSatuan = hargaAnggota.toInt();
  } else {
    hargaSatuan = hargaUmum.toInt();
  }

  double total = (hargaSatuan * jumlahBeli).toDouble();
  double diskon = 0;

  if (total > 200000) {
    diskon = total * 0.10;
  } else if (total > 100000) {
    diskon = total * 0.05;
  } else {
    diskon = 0;
  }

  double hargaAkhir = total - diskon;

  String rak;
  switch (kategori) {
    case "atk":
      rak = "Rak 1";
      break;
    case "makanan":
      rak = "Rak 2";
      break;
    case "minuman":
      rak = "Rak 3";
      break;
    default:
      rak = "Rak lain";
  }

  print("===== TRANSAKSI =====");
  print("Jenis Pembeli : ${anggota ? "Anggota" : "Umum"}");
  print("Nama Barang   : $namaBarang");
  print("Harga Satuan  : ${rupiah.format(hargaSatuan)}");
  print("Jumlah Beli   : $jumlahBeli");
  print("Total         : ${rupiah.format(total)}");
  print("Diskon        : ${rupiah.format(diskon)}");
  print("Harga Akhir   : ${rupiah.format(hargaAkhir)}");
  print("Kategori      : $rak");
  print("=====================");

  runApp(MyApp(
    anggota: anggota,
    hargaSatuan: hargaSatuan,
    jumlahBeli: jumlahBeli,
    total: total,
    diskon: diskon,
    hargaAkhir: hargaAkhir,
    namaBarang: namaBarang,
    kategori: kategori,
    rak: rak,
  ));
}


class MyApp extends StatelessWidget {
  final bool anggota;
  final int hargaSatuan;
  final int jumlahBeli;
  final double total;
  final double diskon;
  final double hargaAkhir;
  final String namaBarang;
  final String kategori;
  final String rak;

  const MyApp({
    super.key,
    required this.anggota,
    required this.hargaSatuan,
    required this.jumlahBeli,
    required this.total,
    required this.diskon,
    required this.hargaAkhir,
    required this.namaBarang,
    required this.kategori,
    required this.rak,
  });

  @override
  Widget build(BuildContext context) {
    final NumberFormat rupiah = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pengujian Program Kasir - RPL-12.2-204'),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hasil Pengujian Transaksi",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jenis Pembeli : ${anggota ? "Anggota" : "Umum"}"),
                      Text("Nama Barang   : $namaBarang"),
                      Text("Harga Satuan  : ${rupiah.format(hargaSatuan)}"),
                      Text("Jumlah Beli   : $jumlahBeli"),
                      const Divider(),
                      Text("Total         : ${rupiah.format(total)}"),
                      Text("Diskon        : ${rupiah.format(diskon)}"),
                      Text(
                        "Harga Akhir   : ${rupiah.format(hargaAkhir)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 18,
                        ),
                      ),
                      const Divider(),
                      Text(
                        "Kategori      : $rak",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
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

// ==========================
// JUSTIFIKASI PENGUJIAN (RPL-12.2-204)
// ==========================
// Program telah bekerja sesuai aturan koperasi. Pada total belanja di atas Rp200.000 
// diberikan diskon 10%, pada total di atas Rp100.000 diberikan diskon 5%, dan pada 
// total Rp100.000 atau kurang tidak diberikan diskon. Harga yang digunakan juga berubah 
// sesuai status pembeli sebagai anggota atau umum, serta posisi rak yang ditentukan 
// menggunakan switch-case.