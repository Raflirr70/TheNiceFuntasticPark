import 'package:flutter/material.dart';
import 'package:the_nice_funstantic_park/data/dprofile.dart';
import 'package:the_nice_funstantic_park/data/favorite.dart';
import 'package:the_nice_funstantic_park/method/ceklisst.dart';
import 'package:the_nice_funstantic_park/page/ulasan.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              size: 30,
            ),
          ),
        ],
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipOval(
                    child: Image.asset(
                      "assets/img/gambar.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Nama Pengguna",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        kategoriButton("Detail Akun", 1),
                        kategoriButton("Tempat Favorit", 2),
                      ],
                    ),
                    const SizedBox(height: 20),
                    tampil()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tampil() {
    if (selectedIndex == 1) {
      // SEMENTARA NANTI DI PINDAH KE REGISTER // 
      Dprofile userProfile =
          Dprofile(isi: ["John Doe", "25", "Jl. Merdeka No. 10"]);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(userProfile.label.length, (index) {
          return cardData(userProfile.label[index], userProfile.isi[index]);
        }),
      );
    } else if (selectedIndex == 2) {
      return gridCardFavorit();
    } else {
      return Container();
    }
  }

  Widget kategoriButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: 110,
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

  Widget cardData(String title, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 40,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            data,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget cardFavorite(
      String title, String gambar, String index, String kategori) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Ulasan(index: index, kategori: kategori);
        })).then((shouldRefresh) {
          if (shouldRefresh == true) {
            setState(() {
              selectedIndex=2;
            });
          }
        });
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              gambar,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            widthFactor: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget gridCardFavorit() {
    List favoriteItems = tampilinFavorite();

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: favoriteItems.isEmpty
            ? kosong()
            : GridView.count(
                crossAxisCount: 2, // Number of columns per row
                crossAxisSpacing: 10, // Space between columns
                mainAxisSpacing: 10, // Space between rows
                children: List.generate(favoriteItems.length, (index) {
                  var item = favoriteItems[index];
                  return cardFavorite(item['title'], item['image'],
                      item['index'], item['kategori']);
                }),
              ),
      ),
    );
  }

  List tampilinFavorite() {
    List hasil = [];

    for (var item in favorit) {
      var kategori = int.tryParse(item.kategori);
      var index = int.tryParse(item.index);

      if (kategori != null && index != null) {
        var fav = ceklist(kategori)[index - 1];

        hasil.add({
          "index": fav["index"],
          "kategori": fav["kategori"],
          "title": fav["title"],
          "image": fav["image"]
        });
      }
    }

    return hasil;
  }

  Widget kosong() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(
              "assets/img/favorite.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Ayo Tambahakan Tempat Favorite Anda",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    ));
  }
}
