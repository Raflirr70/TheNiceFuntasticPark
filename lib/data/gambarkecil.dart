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
    imagePaths: ["assets/img/skybridge.png","assets/img/skybridge2.png","assets/img/skybridge3.png"], 
  ),
  Gambarkecil(
    kategori:1,
    index: 2,
    imagePaths: ["assets/img/swing.png","assets/img/swing2.png","assets/img/swing3.png"], 
  ),
  Gambarkecil(
    kategori:1,
    index: 3,
    imagePaths: ["assets/img/flyingfox.png","assets/img/flyingfox2.png"], 
  ),
  
  Gambarkecil(
    kategori:1,
    index: 4,
    imagePaths: ["assets/img/rainbowslide.png","assets/img/rainbowslide2.png","assets/img/rainbowslide3.png"], 
  ),
  Gambarkecil(
    kategori:2,
    index: 1,
    imagePaths: ["assets/img/slide.png","assets/img/slide2.png","assets/img/slide3.png"], 
  ),
  Gambarkecil(
    kategori:2,
    index: 2,
    imagePaths: ["assets/img/playground.png","assets/img/playground2.png","assets/img/playground3.png"], 
  ),
  Gambarkecil(
    kategori:3,
    index: 1,
    imagePaths: ["assets/img/foodcourt.png", "assets/img/foodcourt2.png", "assets/img/foodcourt3.png"], 
  ),
  Gambarkecil(
    kategori:3,
    index: 2,
    imagePaths: ["assets/img/angkringan.png","assets/img/angkringan2.png","assets/img/angkringan3.png"], 
  ),
];
