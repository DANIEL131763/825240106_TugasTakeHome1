import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Cart',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // --- STATE PRODUK 1 (Headphone) ---
  int qty1 = 1;
  int likes1 = 12;
  bool isSelected1 = false;
  bool isLiked1 = false;
  final int price1 = 350000;

  // --- STATE PRODUK 2 (Laptop) ---
  int qty2 = 1;
  int likes2 = 8;
  bool isSelected2 = false;
  bool isLiked2 = false;
  final int price2 = 7500000;

  // --- STATE PRODUK 3 (Mouse) ---
  int qty3 = 1;
  int likes3 = 5;
  bool isSelected3 = false;
  bool isLiked3 = false;
  final int price3 = 250000;

  // --- STATE NOTIFIKASI (Banner atas) ---
  bool showBanner = false;

  // Fungsi Kalkulasi
  int get totalHarga => (qty1 * price1) + (qty2 * price2) + (qty3 * price3);
  int get totalItem => qty1 + qty2 + qty3;

  // Fungsi untuk memunculkan pesan dari atas (Long Press)
  void _triggerBanner() {
    setState(() {
      showBanner = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => showBanner = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.shopping_cart, color: Colors.white),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('My Cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                Text('Belanja lebih mudah setiap hari', style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),

      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // AREA LIST PRODUK
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      _buildProductCard(
                        name: 'Wireless Headphone',
                        brand: 'Sony WH-CH520',
                        price: price1,
                        qty: qty1,
                        likes: likes1,
                        isSelected: isSelected1,
                        isLiked: isLiked1,
                        // URL Gambar Headphone
                        imageUrl: 'https://images.unsplash.com/photo-1545127398-14699f92334b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2lyZWxlc3MlMjBoZWFkcGhvbmVzfGVufDB8fDB8fHww',
                        onTap: () => setState(() => isSelected1 = !isSelected1),
                        onDoubleTap: () => setState(() {
                          likes1++;
                          isLiked1 = true;
                        }),
                        onLongPress: _triggerBanner,
                        onMinus: () => setState(() { if (qty1 > 0) qty1--; }),
                        onPlus: () => setState(() => qty1++),
                      ),
                      const SizedBox(height: 12),

                      _buildProductCard(
                        name: 'Laptop ASUS Vivobook',
                        brand: 'ASUS',
                        price: price2,
                        qty: qty2,
                        likes: likes2,
                        isSelected: isSelected2,
                        isLiked: isLiked2,
                        // URL Gambar Laptop
                        imageUrl: 'https://images.unsplash.com/photo-1636211991297-6071abc2cec1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bGFwdG9wJTIwYXN1c3xlbnwwfHwwfHx8MA%3D%3D',
                        onTap: () => setState(() => isSelected2 = !isSelected2),
                        onDoubleTap: () => setState(() {
                          likes2++;
                          isLiked2 = true;
                        }),
                        onLongPress: _triggerBanner,
                        onMinus: () => setState(() { if (qty2 > 0) qty2--; }),
                        onPlus: () => setState(() => qty2++),
                      ),
                      const SizedBox(height: 12),

                      _buildProductCard(
                        name: 'Wireless Mouse',
                        brand: 'Logitech M330',
                        price: price3,
                        qty: qty3,
                        likes: likes3,
                        isSelected: isSelected3,
                        isLiked: isLiked3,
                        // URL Gambar Mouse
                        imageUrl: 'https://images.unsplash.com/photo-1660491083562-d91a64d6ea9c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2lyZWxlc3MlMjBtb3VzZXxlbnwwfHwwfHx8MA%3D%3D',
                        onTap: () => setState(() => isSelected3 = !isSelected3),
                        onDoubleTap: () => setState(() {
                          likes3++;
                          isLiked3 = true;
                        }),
                        onLongPress: _triggerBanner,
                        onMinus: () => setState(() { if (qty3 > 0) qty3--; }),
                        onPlus: () => setState(() => qty3++),
                      ),
                    ],
                  ),
                ),

                // AREA CHECKOUT
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5, offset: const Offset(0, -2))],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total ($totalItem produk)', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          Text('Rp $totalHarga', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                        ),
                        onPressed: totalHarga > 0 ? () {} : null,
                        child: const Text('Checkout', style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          // PESAN NOTIFIKASI GELAP
          if (showBanner)
            Positioned(
              top: 10,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Produk dipilih!\nSilakan lanjutkan proses checkout.',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    Icon(Icons.close, color: Colors.grey, size: 16),
                  ],
                ),
              ),
            ),
        ],
      ),

      // AREA NAVIGASI BAWAH
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Kategori'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Keranjang'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Akun'),
        ],
      ),
    );
  }

  // ==============================================================
  // WIDGET KARTU PRODUK (Telah dimodifikasi untuk Gambar)
  // ==============================================================
  Widget _buildProductCard({
    required String name,
    required String brand,
    required int price,
    required int qty,
    required int likes,
    required bool isSelected,
    required bool isLiked,
    required String imageUrl, // Parameter baru untuk link gambar
    required VoidCallback onTap,
    required VoidCallback onDoubleTap,
    required VoidCallback onLongPress,
    required VoidCallback onMinus,
    required VoidCallback onPlus,
  }) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey.shade200, width: 2),
        ),
        child: Row(
          children: [
            // AREA GAMBAR PRODUK
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  // Fallback jika gambar gagal dimuat karena tidak ada internet
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, color: Colors.grey);
                  },
                ),
              ),
            ),
            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(brand, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 4),
                  Text('Rp $price', style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.blue, fontSize: 14)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        size: 16,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text('$likes', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  IconButton(
                    onPressed: onMinus,
                    icon: const Icon(Icons.remove, size: 16, color: Colors.blue),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
                  ),
                  Text('$qty', style: const TextStyle(fontWeight: FontWeight.bold)),
                  IconButton(
                    onPressed: onPlus,
                    icon: const Icon(Icons.add, size: 16, color: Colors.blue),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}