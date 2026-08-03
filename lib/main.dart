import 'package:flutter/material.dart';

void main() {
  // ==========================
  // RPL-12.2-102
  // KARTU DATA BARANG
  // ==========================

  String namaBarang = "Buku Tulis";
  double hargaAnggota = 3500;
  double hargaUmum = 4000;
  int jumlahStok = 120;
  bool tersedia = true;

  print("===== KARTU DATA BARANG =====");
  print("Nama Barang: $namaBarang");
  print("Harga Anggota: Rp${hargaAnggota.toInt()}");
  print("Harga Umum: Rp${hargaUmum.toInt()}");
  print("Jumlah Stok: $jumlahStok");
  print("Tersedia: ${tersedia ? "Ya" : "Tidak"}");
  print("============================");

  // ==========================
  // RPL-12.2-103
  // PERHITUNGAN HARGA
  // ==========================

  int jumlahBeli = 3;

  double totalAnggota = jumlahBeli * hargaAnggota;
  double totalUmum = jumlahBeli * hargaUmum;
  double selisih = totalUmum - totalAnggota;

  print("");
  print("===== DATA PEMBELIAN =====");
  print("Nama Barang : $namaBarang");
  print("Jumlah Beli : $jumlahBeli");
  print("Harga Anggota : Rp${hargaAnggota.toInt()}");
  print("Harga Umum : Rp${hargaUmum.toInt()}");
  print("------------------------------");
  print("Total (anggota): Rp${totalAnggota.toInt()}");
  print("Total (umum): Rp${totalUmum.toInt()}");
  print("Selisih Harga: Rp${selisih.toInt()}");
  print("==============================");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Belajar Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Aplikasi Belajar Flutter',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    const String namaBarang = "Buku Tulis";
    const double hargaAnggota = 3500;
    const double hargaUmum = 4000;
    const int jumlahStok = 120;
    const bool tersedia = true;
    const int jumlahBeli = 3;

    final double totalAnggota = jumlahBeli * hargaAnggota;
    final double totalUmum = jumlahBeli * hargaUmum;
    final double selisih = totalUmum - totalAnggota;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                const SizedBox(height: 10),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 30),

                const Divider(),

                const Text(
                  'Kartu Data Barang',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text("Nama Barang : $namaBarang"),
                        Text("Harga Anggota : Rp${hargaAnggota.toInt()}"),
                        Text("Harga Umum : Rp${hargaUmum.toInt()}"),
                        Text("Jumlah Stok : $jumlahStok"),
                        Text("Tersedia : ${tersedia ? "Ya" : "Tidak"}"),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Divider(),

                const Text(
                  "Perhitungan Pembelian",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text("Jumlah Beli : $jumlahBeli"),
                        Text(
                          "Total (Anggota) : Rp${totalAnggota.toInt()}",
                        ),
                        Text(
                          "Total (Umum) : Rp${totalUmum.toInt()}",
                        ),
                        Text(
                          "Selisih Harga : Rp${selisih.toInt()}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Pemilihan tipe data yang tepat membuat data kasir lebih akurat dan mudah diproses.
// Tipe data yang sesuai mengurangi kesalahan perhitungan harga, stok, dan status barang.
// Dengan demikian, transaksi di koperasi menjadi lebih cepat dan terpercaya.