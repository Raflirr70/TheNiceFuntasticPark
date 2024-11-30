class Gambarkecil {
  final int kategori;
  final int index;
  List<String> imagePaths;

  Gambarkecil({required this.index, required this.imagePaths,required this.kategori});
}

List<Gambarkecil> gambarList = [
  Gambarkecil(
    kategori:1,
    index: 1,
    imagePaths: ["assets/img/contoh.jpeg", "assets/img/gambar.jpg"], 
  ),
  Gambarkecil(
    kategori:1,
    index: 2,
    imagePaths: ["assets/img/arrow.png", "assets/img/gambar.jpg"], 
  ),
  Gambarkecil(
    kategori:1,
    index: 3,
    imagePaths: ["assets/img/gambar.jpg", "assets/img/gambar.jpg"], 
  ),
  
  Gambarkecil(
    kategori:2,
    index: 2,
    imagePaths: ["assets/img/gambar.jpg", "assets/img/gambar.jpg"], 
  ),
];
