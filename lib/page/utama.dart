import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_nice_funstantic_park/page/kategori.dart';
import 'package:the_nice_funstantic_park/page/search.dart';
import 'package:the_nice_funstantic_park/page/ulasan.dart';
import 'package:the_nice_funstantic_park/data/list_halaman_utama.dart';
import 'package:the_nice_funstantic_park/data/gambargerak.dart';

class Utama extends StatefulWidget {
  const Utama({super.key});

  @override
  State<Utama> createState() => _UtamaState();
}

class _UtamaState extends State<Utama> {
  int selectedIndex = 0;
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), _nextPage);
  }

  void _nextPage() {
    if (_controller.hasClients) {
      setState(() {
        _currentPage = (_currentPage + 1) % gambar.length;
      });
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
      Future.delayed(const Duration(seconds: 5), _nextPage);
    }
  }

  void navigateToPage(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
       
        bool exitApp = await _showExitDialog(context);
        return exitApp;
      },
      child: Scaffold(
        body: Stack(
          children: [
            gambarBadag(context),
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width / 2 - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(gambar.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 10 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.red : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight / 4 + 70),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        kategoriButton("Destinasi", 0),
                        kategoriButton("Play Ground", 1),
                        kategoriButton("Restoran", 2),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(child: tampil()),
                  ],
                ),
              ),
            ),
            createAppbar(),
          ],
        ),
      ),
    );
  }

  Future<bool> _showExitDialog(BuildContext context) async {
  // Menampilkan dialog konfirmasi keluar aplikasi
  return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Konfirmasi"),
          content: const Text("Apakah Anda yakin ingin keluar dari aplikasi?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Tidak keluar
              },
              child: const Text("Tidak"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Keluar aplikasi
                SystemNavigator.pop();  // Menutup aplikasi
              },
              child: const Text("Ya"),
            ),
          ],
        ),
      )) ??
      false;
}


  Widget gambarBadag(BuildContext context) {
    // Pastikan daftar gambar tidak kosong
    if (gambar.isEmpty) {
      return const Center(child: Text("Tidak ada gambar"));
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2 - 95,
      child: PageView(
        controller: _controller,
        children: gambar.map((image) {
          return Image.asset(
            image,
            fit: BoxFit.cover,
          );
        }).toList(),
      ),
    );
  }

  Widget tampil() {
    if (selectedIndex == 0) {
      return listViewBuilder(destinasiData);
    } else if (selectedIndex == 1) {
      return listViewBuilder(playgroundData);
    } else if (selectedIndex == 2) {
      return listViewBuilder(restoranData);
    }
    return Container();
  }

  Widget listViewBuilder(List<Map<String, String>> data) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(data.length, (index) {
          return cardItem(
            data[index]["title"] ?? "Unknown",
            data[index]["description"] ?? "No Description",
            data[index]["image"] ?? "assets/img/default.jpg",
            data[index]["index"] ?? "0",
            data[index]["kategori"] ?? "0",
          );
        }),
      ),
    );
  }

  Widget cardItem(String title, String description, String image, String index,
      String kategori) {
    List<String> words = description.split(" ");
    String truncatedDescription =
        words.length > 10 ? "${words.sublist(0, 10).join(" ")}..." : description;

    return GestureDetector(
      onTap: () {
        navigateToPage(Ulasan(index: index, kategori: kategori));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(4, 8),
                blurRadius: 10,
              )
            ],
            border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 8,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          truncatedDescription,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 9),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 10, bottom: 10),
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red,
                            ),
                            child: const Center(
                              child: Text(
                                "Ulasan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
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

  Widget createAppbar() {
    return Positioned(
      top: 20,
      left: 7,
      right: 7,
      child: Container(
        height: MediaQuery.of(context).size.height / 14,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                navigateToPage(const Kategorii());
              },
              icon: const Icon(Icons.apps),
              iconSize: 40,
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                navigateToPage(const Search());
              },
              icon: const Icon(Icons.search),
              iconSize: 40,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget kategoriButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selectedIndex == index ? Colors.red : Colors.white,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selectedIndex == index ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
