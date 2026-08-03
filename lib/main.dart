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
  // RPL-12.2-302 (PERULANGAN WHILE - SIMULASI STOK)
  // ==========================
  int stokBuku = 3;

  print("--- Penjualan Buku Tulis ---");
  while (stokBuku > 0) {
    stokBuku--;
    print("Terjual 1, sisa stok: $stokBuku");
  }
  print("----------------------------\n");

  // ==========================
  // RPL-12.2-301 (DAFTAR BARANG DENGAN LIST & FOR)
  // ==========================
  List<String> namaBarangList = [
    "Buku Tulis",
    "Pulpen",
    "Penghapus",
    "Roti",
    "Pensil"
  ];

  List<int> hargaBarangList = [
    3000,
    2500,
    1500,
    5000,
    2000
  ];

  print("=== DAFTAR BARANG ===");
  for (int i = 0; i < namaBarangList.length; i++) {
    print("${i + 1}. ${namaBarangList[i]} - Rp. ${hargaBarangList[i]}");
  }
  print("=====================");

  // ==========================
  // TRANSAKSI UTAMA & VALIDASI (HOTS-1, HOTS-2, & HOTS-3)
  // ==========================
  bool anggota = true;
  double hargaAnggota = 10000;
  double hargaUmum = 12000;
  int jumlahBeli = 60; // Total = 600.000
  String namaBarangAktif = "Buku Tulis Paket";
  String kategori = "makanan";

  int hargaSatuan;
  if (anggota) {
    hargaSatuan = hargaAnggota.toInt();
  } else {
    hargaSatuan = hargaUmum.toInt();
  }

  double total = hargaSatuan.toDouble() * jumlahBeli;

  // Validasi input negatif (HOTS-2)
  if (total < 0) {
    print("ERROR: Total transaksi tidak boleh bernilai negatif.");
    return;
  }

  double diskon = 0;

  // Aturan diskon bertingkat (Urutan benar: dari terbesar ke terkecil - HOTS-3)
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

  print("");
  print("===== TRANSAKSI KASIR =====");
  print("Jenis Pembeli : ${anggota ? "Anggota" : "Umum"}");
  print("Nama Barang   : $namaBarangAktif");
  print("Harga Satuan  : ${rupiah.format(hargaSatuan)}");
  print("Jumlah Beli   : $jumlahBeli");
  print("Total         : ${rupiah.format(total)}");
  print("Diskon        : ${rupiah.format(diskon)}");
  print("Harga Akhir   : ${rupiah.format(hargaAkhir)}");
  print("Kategori      : $rak");
  print("===========================");

  runApp(MyApp(
    anggota: anggota,
    hargaSatuan: hargaSatuan,
    jumlahBeli: jumlahBeli,
    total: total,
    diskon: diskon,
    hargaAkhir: hargaAkhir,
    namaBarang: namaBarangAktif,
    kategori: kategori,
    rak: rak,
    namaBarangList: ['Buku Tulis', 'Pulpen', 'Penghapus', 'Roti', 'Pensil'],
    hargaBarangList: [3000, 2500, 1500, 5000, 2000],
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
  final List<String> namaBarangList;
  final List<int> hargaBarangList;

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
    required this.namaBarangList,
    required this.hargaBarangList,
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
          title: const Text('Tutorial Lengkap — RPL-12.2-302'),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "=== DAFTAR BARANG KOPERASI ===",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      namaBarangList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          "${index + 1}. ${namaBarangList[index]} - Rp. ${hargaBarangList[index]}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Divider(),
              const Text(
                "Hasil Transaksi & Validasi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

// Hati-hati banget ya, kalau salah nulis kondisi while bisa fatal akibatnya—programnya bisa nyangkut dan muter-muter terus tanpa henti (infinite loop), atau parahnya malah bikin stok barang jadi minus. Kalau kejadian di dunia nyata, koperasi bisa-bisa nombok atau jualan barang fiktif yang aslinya udah ludes.
//
// Makanya, biar aman dan nggak kebobolan jualan barang melebihi stok yang ada, kuncinya wajib pakai kondisi while (stok > 0). Dengan cara itu, proses transaksinya bakal otomatis berhenti tepat pas stok barangnya bener-bener sisa 0.