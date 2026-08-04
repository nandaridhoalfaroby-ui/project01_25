import 'package:flutter/material.dart';

// Fungsi pertama: Menghitung total belanja
double hitungTotal(int jumlah, double harga) {
  return jumlah * harga;
}

// Fungsi kedua: Menghitung harga akhir setelah diskon
double hitungHargaAkhir(double total, double persenPotongan) {
  return total - (total * persenPotongan / 100);
}

// Fungsi ketiga: Komposisi fungsi (bayarAkhir memanggil hitungTotal dan hitungHargaAkhir)
double bayarAkhir(int jumlah, double harga, double persenPotongan) {
  double total = hitungTotal(jumlah, harga);
  return hitungHargaAkhir(total, persenPotongan);
}

void main() {
  int jumlah = 50;
  double harga = 5000;
  double potongan = 10;

  double hasil = bayarAkhir(jumlah, harga, potongan);

  print("Jumlah Barang : $jumlah");
  print("Harga Satuan : Rp$harga");
  print("Potongan : $potongan%");
  print("Bayar Akhir : Rp$hasil");

  runApp(MyApp(
    jumlah: jumlah,
    harga: harga,
    potongan: potongan,
    hasil: hasil,
  ));
}

class MyApp extends StatelessWidget {
  final int jumlah;
  final double harga;
  final double potongan;
  final double hasil;

  const MyApp({
    super.key,
    required this.jumlah,
    required this.harga,
    required this.potongan,
    required this.hasil,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas RPL-12.2-4S2 — HOTS-2 (Komposisi Fungsi)'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Simulasi Pembayaran Akhir",
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
                      Text("Potongan : $potongan%"),
                      const Divider(),
                      Text(
                        "Bayar Akhir : Rp$hasil",
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

// Menyusun fungsi dari fungsi lain membuat program lebih modular,
// rapi, dan mudah dipelihara. Jika cara menghitung total atau harga
// akhir berubah, cukup mengubah fungsi terkait tanpa perlu mengubah
// fungsi bayarAkhir() maupun bagian program lainnya.