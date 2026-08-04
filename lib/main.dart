import 'package:flutter/material.dart';

// Fungsi pertama: Menghitung total belanja
double hitungTotal(int jumlah, double harga) {
  return jumlah * harga;
}

// Fungsi kedua: Menghitung harga akhir setelah diskon
double hitungHargaAkhir(double total, double persenPotongan) {
  return total - (total * persenPotongan / 100);
}

void main() {
  int jumlah = 50;
  double harga = 5000;

  double total = hitungTotal(jumlah, harga);

  double potongan;
  if (total > 200000) {
    potongan = 10;
  } else if (total > 100000) {
    potongan = 5;
  } else {
    potongan = 0;
  }

  double hargaAkhir = hitungHargaAkhir(total, potongan);

  print("Jumlah Barang : $jumlah");
  print("Harga Satuan : Rp$harga");
  print("Total : Rp$total");
  print("Potongan : $potongan%");
  print("Harga Akhir : Rp$hargaAkhir");

  runApp(MyApp(
    jumlah: jumlah,
    harga: harga,
    total: total,
    potongan: potongan,
    hargaAkhir: hargaAkhir,
  ));
}

class MyApp extends StatelessWidget {
  final int jumlah;
  final double harga;
  final double total;
  final double potongan;
  final double hargaAkhir;

  const MyApp({
    super.key,
    required this.jumlah,
    required this.harga,
    required this.total,
    required this.potongan,
    required this.hargaAkhir,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas RPL-12.2-402 — Fungsi Hitung Harga Akhir'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Simulasi Transaksi & Diskon",
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
                      Text("Jumlah Barang : $jumlah"),
                      Text("Harga Satuan : Rp$harga"),
                      const Divider(),
                      Text("Total : Rp$total"),
                      Text("Potongan : $potongan%"),
                      const Divider(),
                      Text(
                        "Harga Akhir : Rp$hargaAkhir",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 18,
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

// Nah, mecah program jadi fungsi-fungsi kecil kayak gini tuh ngebantu banget biar kodenya nggak semrawut dan gampang dipelajari. 
// Jadi, misal besok-besok aturan diskonnya direvisi atau diganti, kita cukup ngerombak logika di dalem fungsi `hitungHargaAkhir()` 
// atau pas bagian nentuin persentasenya aja. Otomatis, perubahan itu bakal langsung ngefek ke semua transaksi tanpa perlu repot 
// rix ngebeber and ngerubah rumus satu-satu di banyak tempat!