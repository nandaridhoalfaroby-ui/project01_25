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
  // RPL-12.2-2S1 (HOTS-1: DISKON KHUSUS ANGGOTA > 500 RIBU)
  // Ubah variabel di bawah ini untuk menguji berbagai skenario:
  // Pengujian 1: bool anggota = true, hargaAnggota = 10000, jumlahBeli = 60 (Total = 600.000 -> Diskon 15%)
  // Pengujian 2: bool anggota = true, hargaAnggota = 5000, jumlahBeli = 50 (Total = 250.000 -> Diskon 10%)
  // Pengujian 3: bool anggota = false, hargaUmum = 6000, jumlahBeli = 25 (Total = 150.000 -> Diskon 5%)
  // ==========================
  bool anggota = true;
  double hargaAnggota = 10000;
  double hargaUmum = 12000;
  int jumlahBeli = 60;
  String namaBarang = "Buku Tulis Paket";
  String kategori = "atk";

  int hargaSatuan;
  if (anggota) {
    hargaSatuan = hargaAnggota.toInt();
  } else {
    hargaSatuan = hargaUmum.toInt();
  }

  double total = hargaSatuan.toDouble() * jumlahBeli;
  double diskon = 0;

  // Aturan baru: anggota dengan total lebih dari Rp500.000
  // mendapatkan diskon khusus sebesar 15%.
  // Kondisi ini diletakkan di awal agar tidak tertimpa aturan diskon lama.
  if (anggota && total > 500000) {
    diskon = total * 0.15;
  } else if (total > 200000) {
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

  print("===== TRANSAKSI (HOTS-1) =====");
  print("Jenis Pembeli : ${anggota ? "Anggota" : "Umum"}");
  print("Nama Barang   : $namaBarang");
  print("Harga Satuan  : ${rupiah.format(hargaSatuan)}");
  print("Jumlah Beli   : $jumlahBeli");
  print("Total         : ${rupiah.format(total)}");
  print("Diskon        : ${rupiah.format(diskon)}");
  print("Harga Akhir   : ${rupiah.format(hargaAkhir)}");
  print("Kategori      : $rak");
  print("==============================");

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
          title: const Text('Tugas HOTS-1 — RPL-12.2-2S1'),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Perhitungan Diskon Khusus (HOTS-1)",
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
// CATATAN KERJA (RPL-12.2-2S1)
// ==========================
// Saya menambahkan aturan baru yaitu anggota dengan total belanja lebih dari Rp500.000 
// mendapatkan diskon 15%. Aturan tersebut ditempatkan pada kondisi paling awal agar tidak 
// tertutup oleh aturan diskon lama sebesar 10% dan 5%.
// 
// Pengujian dilakukan pada tiga kondisi:
// 1. Anggota > Rp500.000 mendapatkan diskon 15%.
// 2. Anggota Rp250.000 tetap mendapatkan diskon lama 10%.
// 3. Umum Rp150.000 tetap mendapatkan diskon lama 5%.
// 
// Hasil pengujian menunjukkan bahwa aturan baru berjalan dengan benar dan tidak merusak aturan sebelumnya.