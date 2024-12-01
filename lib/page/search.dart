import 'package:flutter/material.dart';
import 'package:the_nice_funstantic_park/data/list_halaman_utama.dart';
import 'package:the_nice_funstantic_park/page/ulasan.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<Map<String, String>> allItems = [
    ...destinasiData,
    ...playgroundData,
    ...restoranData,
  ];

  List<Map<String, String>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
  }

  void _filterItems(String query) {
    final results = allItems.where((item) {
      return item["title"]!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: _filterItems,
              decoration: const InputDecoration(
                labelText: 'Search for a title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredItems.isEmpty
                  ? notfound()
                  : ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Ulasan(
                                    index: filteredItems[index]['index']
                                        .toString(),
                                    kategori: filteredItems[index]['kategori']
                                        .toString());
                              },
                            ));
                          },
                          child: ListTile(
                            title: Text(
                                filteredItems[index]["title"] ?? "Unknown"),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget notfound() {
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
          width: 100,
          height: 100,
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(
              "assets/img/notfound.png",
              fit: BoxFit.cover,
            ),
          )),
      const SizedBox(
        height: 10,
      ),
      const Text(
        "Maaf Data Tidak Di Temukan",
        style: TextStyle(fontWeight: FontWeight.bold),
      )
    ],
  ));
}
