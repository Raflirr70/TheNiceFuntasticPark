import 'package:flutter/material.dart';
import 'package:the_nice_funstantic_park/data/favorite.dart';
import 'package:the_nice_funstantic_park/data/list_komentar.dart';
import 'package:the_nice_funstantic_park/data/gambarkecil.dart';
import 'package:the_nice_funstantic_park/method/ceklisst.dart';
import 'package:the_nice_funstantic_park/page/allcoment.dart';
import 'package:the_nice_funstantic_park/page/map.dart';

class Ulasan extends StatefulWidget {
  final String index;
  final String kategori;

  const Ulasan({super.key, required this.index, required this.kategori});

  @override
  State<Ulasan> createState() => _UlasanState();
}

class _UlasanState extends State<Ulasan> {
  bool isExpanded = false;
  late String shortDescription;
  late String fullDescription;
  late String title;
  late String image;
  late int index;
  late int kategori;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    index = int.tryParse(widget.index) ?? 0;
    kategori = int.tryParse(widget.kategori) ?? 0;
    final review = ceklist(kategori).firstWhere(
      (element) => element['index'] == widget.index,
      orElse: () => {
        "title": "Data tidak ditemukan",
        "description": "",
        "image": "img/not_found.jpg"
      },
    );
    title = review['title']!;
    image = review['image']!;
    fullDescription = review['description']!;
    shortDescription = fullDescription.length > 100
        ? "${fullDescription.substring(0, 100)}..."
        : fullDescription;

    // Cek apakah sudah ada di daftar pavorit //
    isFavorite = favorit.any((item) =>
        item.kategori == kategori.toString() && item.index == index.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gambarBesar(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                            if (isFavorite) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Ditambahkan Ke Favorit'),
                                    duration: Duration(seconds: 2)),
                              );
                              favorit.add(Favorite(
                                  kategori: kategori.toString(),
                                  index: index.toString()));
                            } else {
                              favorit.removeWhere((item) =>
                                  item.kategori == kategori.toString() &&
                                  item.index == index.toString());
                            }
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                          color: isFavorite ? Colors.red : Colors.black,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("Deskripsi"),
                  const SizedBox(height: 20),
                  Text(
                    isExpanded ? fullDescription : shortDescription,
                    style: const TextStyle(fontSize: 16),
                  ),
                  if (fullDescription.length > 100)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? "Tutup" : "Baca Selengkapnya",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  const Text(
                    "Gambar Lainnya",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  gambarLainya(index, kategori),
                  const SizedBox(height: 20),
                  const Text(
                    "Ulasan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  komentar(context),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AllCommentsPage(
                          index: widget.index,
                          kategori: widget.kategori,
                        );
                      })).then((shouldRefresh) {
                        if (shouldRefresh == true) {
                          setState(() {});
                        }
                      });
                    },
                    child: const Center(
                      child: Text(
                        "Lihat Semua Ulasan",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget komentar(BuildContext context) {
    final reviewData = reviews.firstWhere(
      (review) =>
          review.index == widget.index && review.kategori == widget.kategori,
      orElse: () =>
          tReview(index: widget.index, kategori: widget.kategori, comments: []),
    );

    if (reviewData.comments.isEmpty) {
      return const Center(child: Text('Belum ada ulasan.'));
    }

    return Column(
      children: reviewData.comments
          .take(2)
          .map((review) => ulasanCard(review))
          .toList(),
    );
  }

  Widget ulasanCard(Review review) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/img/gambar.jpg",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(review.username),
              ),
            ],
          ),
          const SizedBox(height: 10),
          rating(review.rating),
          const SizedBox(height: 10),
          Text(review.comment),
        ],
      ),
    );
  }

  Widget gambarBesar(BuildContext context) {
  return Stack(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context, true);
            });
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 1,
                offset: const Offset(1, 1),
              ),
            ],
          ),
        ),
      ),
     mapp(widget.kategori,widget.index)
    ],
  );
}


  Widget gambarLainya(int index, int kategori) {
    final gambar = gambarList.firstWhere(
      (gambar) => gambar.index == index && gambar.kategori == kategori,
      orElse: () => Gambarkecil(index: 0, imagePaths: [], kategori: 0),
    );

    if (gambar.imagePaths.isEmpty) {
      return const Center(child: Text('Gambar tidak tersedia'));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: gambar.imagePaths.map((path) => gambarKecil(path)).toList(),
      ),
    );
  }

 Widget gambarKecil(String imagePath) {
  return GestureDetector(
    onTap: () {
      setState(() {
        image = imagePath;
      });
    },
    child: Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        width: 100,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}


  Widget rating(int x) {
    
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: index < x ? Colors.amber : Colors.grey,
          size: 24,
        ),
      ),
    );
  }

  Widget mapp(String kategori,String index)
  {
    return  Positioned(
        bottom: 10,
        right: 10,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Mapp(kategori: kategori, index: index);
                },));
              },
              icon: const Icon(Icons.location_on_sharp, color: Colors.white),
            ),
          ),
        ),
      );
  }
}
