import 'package:flutter/material.dart';
import 'package:the_nice_funstantic_park/data/map.dart';
import 'package:the_nice_funstantic_park/page/kategori.dart';
import 'package:the_nice_funstantic_park/page/ulasan.dart';

class Mapp extends StatefulWidget {
  final String kategori;
  final String index;

  const Mapp({super.key,required this.kategori ,required this.index});

  @override
  State<Mapp> createState() => _MappState();
}

class _MappState extends State<Mapp> {
  double initialScale = 1; // Skala awal gambar
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map The Nice Funtastic"),
      ),
      backgroundColor: Color(0xFFAaF2FF),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return InteractiveViewer(
            boundaryMargin: EdgeInsets.all(20.0),
            minScale: 0.5, // Skala minimum zoom-out
            maxScale: 4.0, // Skala maksimum zoom-in
            child: Center(
              child: Transform.scale(
                scale: initialScale, // Skala awal
                child: Transform.rotate(
                    angle: 0, // Rotasi 90 derajat
                    child: Image.asset(
                    cariGambar(widget.kategori,widget.index), // Ganti dengan path gambar Anda
                      fit:
                          BoxFit.contain, // Atur agar gambar sesuai dalam wadah
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Fungsi card dengan posisi dinamis
Widget card(BuildContext context, double top, double left, String index,
    String kategori) {
  return Positioned(
    top: top, // Jarak dari atas layar (dinamis)
    left: left, // Jarak dari kiri layar (dinamis)
    child: GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Ulasan(
              index: index, kategori: kategori); // Navigasi ke halaman Ulasan
        }));
      },
      child: Container(
        width: 20, // Ukuran kontainer
        height: 20, // Tinggi kontainer
        padding:
            const EdgeInsets.all(10), // Jarak antara teks dan tepi kontainer
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(
              0.5), // Warna latar belakang kotak dengan transparansi
          borderRadius: BorderRadius.circular(
              15), // Menambahkan sudut membulat pada kotak
        ),
      ),
    ),
  );
  
}


String cariGambar(String kategori, String index) {
  var hasil = map.firstWhere(
    (item) => item.kategori == kategori && item.index == index,
    orElse: () => Map(kategori: "", index: "", gambar: "assets/img/map.jpg"),
  );
  return hasil.gambar;
}