import 'package:flutter/material.dart';
import 'package:the_nice_funstantic_park/method/ceklisst.dart';
import 'package:the_nice_funstantic_park/page/profile.dart';
import 'package:the_nice_funstantic_park/page/ulasan.dart';

class Kategorii extends StatefulWidget {
  const Kategorii({super.key});

  @override
  State<Kategorii> createState() => _KategoriiState();
}

class _KategoriiState extends State<Kategorii> {
  // Jang DropDown //
  Map<String, bool> isExpanded = {
    "Wahana Bermain": false,
    "Wahana Bermain Keluarga": false,
    "Restaurant": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          createAppbar(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Kategori Wisata",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


                   // Drop Down //
                  const SizedBox(height: 20),
                  kategoriContainer(context, "Wahana Bermain",1),
                  const SizedBox(height: 15),
                  kategoriContainer(context, "Wahana Bermain Keluarga",2),
                  const SizedBox(height: 15),
                  kategoriContainer(context, "Restaurant",3),



                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  // Drop Down //
  Widget kategoriContainer(BuildContext context, String title,int kategori) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded[title] = !(isExpanded[title] ?? false);
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  isExpanded[title] == true
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded,
                  size: 30,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded[title] == true) ...[
          // Isi Drop Down //
          Container(
            color: Colors.red.shade100, 
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               
                  // Pengecekan list_halamn utama  dan mengambil isi list na //
                  ...List.generate(ceklist(kategori).length, (index) {
                    var destinasi = ceklist(kategori)[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        listItem(destinasi['title'].toString(),destinasi['index'],destinasi['kategori']), 
                        const SizedBox(height: 10),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ],
    ),
  );
}



  // Style Isi Drop Down //
  Widget listItem(String name,String index,String kategori) {
    return GestureDetector(
      onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Ulasan(index: index, kategori: kategori);
        },));
      },
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }


  // Jang app bar //
  Widget createAppbar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: MediaQuery.of(context).size.height / 14,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          // Tombol Menu //
          IconButton(
            onPressed: () {
              Navigator.pop(context,true);
            },


            icon: const Icon(Icons.apps),
            iconSize: 40,
            color: Colors.white,
          ),


          // Tombol Profil //
          IconButton(
            onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Profile();
        })).then((shouldRefresh) {
          if (shouldRefresh == true) {
            setState(() {
              
            });
          }
        });
      },



            icon: const Icon(Icons.person),
            iconSize: 40,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
