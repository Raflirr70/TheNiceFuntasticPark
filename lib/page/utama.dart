import 'package:flutter/material.dart';
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
    if (_currentPage < gambar.length - 1) {
      _controller.animateToPage(
        _currentPage + 1,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
      });
    } else {
      _controller.animateToPage(
        0,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage = 0;
      });
    }
   
    Future.delayed(const Duration(seconds: 5), _nextPage);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
         
          gambarBadag(context),

          // Main content
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
                  // Category Buttons
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

          // AppBar
          createAppbar(),
        ],
      ),
    );
  }

  Widget gambarBadag(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2-95,
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

  // Category display
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
        words.length > 10 ? "${words.sublist(0, 5).join(" ")}..." : description;

    return Padding(
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        truncatedDescription,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Ulasan(
                                  index: index,
                                  kategori: kategori,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 10, bottom: 10),
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green,
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
                    ),
                  ],
                ),
              ),
            ),
          ],
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Kategorii();
                })).then((shouldRefresh) {
                  if (shouldRefresh == true) {
                    setState(() {
                      selectedIndex = 0;
                    });
                  }
                });
              },
              icon: const Icon(Icons.apps),
              iconSize: 40,
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Search();
                },));
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
          borderRadius: BorderRadius.circular(5),
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
