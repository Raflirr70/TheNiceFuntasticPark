import 'package:flutter/material.dart';
import 'package:the_nice_funstantic_park/page/ulasan.dart';

class Mapp extends StatefulWidget {
  const Mapp({super.key});

  @override
  State<Mapp> createState() => _MappState();
}

class _MappState extends State<Mapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth; // Lebar layar
          double screenHeight = constraints.maxHeight; // Tinggi layar
          
          return Stack(
            children: [
              // Gambar sebagai latar belakang
              Container(
                width: screenWidth,
                height: screenHeight,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/map.png"), // Ganti dengan path gambar Anda
                    fit: BoxFit.cover, // Menyesuaikan gambar untuk memenuhi layar
                  ),
                ),
              ),
             
            ],
          );
        },
      ),
    );
  }
}

// Fungsi card dengan posisi dinamis
Widget card(BuildContext context, double top, double left, String index, String kategori) {
  return Positioned(
    top: top, // Jarak dari atas layar (dinamis)
    left: left, // Jarak dari kiri layar (dinamis)
    child: GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Ulasan(index: index, kategori: kategori); // Navigasi ke halaman Ulasan
        }));
      },
      child: Container(
        width: 20, // Ukuran kontainer
        height: 20, // Tinggi kontainer
        padding: const EdgeInsets.all(10), // Jarak antara teks dan tepi kontainer
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5), // Warna latar belakang kotak dengan transparansi
          borderRadius: BorderRadius.circular(15), // Menambahkan sudut membulat pada kotak
        ),
       
      ),
    ),
  );
}
