import 'package:flutter/material.dart';

class InfoPajakPage extends StatelessWidget {
  const InfoPajakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Panduan & Edukasi Pajak',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Pelajari istilah dan aturan dasar perpajakan di Indonesia untuk mempermudah perhitunganmu.',
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),

          // Artikel 1
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const ExpansionTile(
              leading: Icon(Icons.help_outline, color: Colors.blue),
              title: Text('Apa itu PTKP?', style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'PTKP (Penghasilan Tidak Kena Pajak) adalah batasan besaran penghasilan bulanan/tahunan yang dibebaskan dari pemotongan PPh 21. Jika gaji kamu di bawah PTKP, kamu tidak wajib membayar PPh 21.',
                    style: TextStyle(height: 1.5),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Artikel 2
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const ExpansionTile(
              leading: Icon(Icons.storefront, color: Colors.green),
              title: Text('Aturan Pajak UMKM (0.5%)', style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Sesuai UU HPP, UMKM perseorangan dengan omzet (pendapatan kotor) di bawah Rp 500 juta dalam setahun TIDAK dikenakan pajak. Omzet yang melebihi angka tersebut baru dikenakan Pajak Final sebesar 0,5%.',
                    style: TextStyle(height: 1.5),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Artikel 3
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const ExpansionTile(
              leading: Icon(Icons.credit_card_off, color: Colors.red),
              title: Text('Denda Tidak Punya NPWP', style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Bagi pekerja atau wajib pajak yang sudah berpenghasilan di atas PTKP namun tidak memiliki NPWP, maka tarif pajak yang dikenakan akan lebih tinggi 20% dibandingkan mereka yang memiliki NPWP.',
                    style: TextStyle(height: 1.5),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}