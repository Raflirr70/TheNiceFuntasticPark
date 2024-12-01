import 'package:flutter/material.dart';
import 'package:the_nice_funstantic_park/data/list_halaman_utama.dart';
import 'package:the_nice_funstantic_park/page/ulasan.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // Combined list from destinasiData, playgroundData, and restoranData
  final List<Map<String, String>> allItems = [
    ...destinasiData,
    ...playgroundData,
    ...restoranData,
  ];

  // List to hold filtered results
  List<Map<String, String>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems; // Initially, show all items
  }

  // Method to filter items based on search query
  void _filterItems(String query) {
    final results = allItems.where((item) {
      return item["title"]!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredItems = results; // Update filtered list
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
            // Search input field
            TextField(
              onChanged: _filterItems, // Update filter on text change
              decoration: const InputDecoration(
                labelText: 'Search for a title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Display filtered list
            Expanded(
              child: filteredItems.isEmpty
                  ? const Center(child: Text("No results found"))
                  : ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Ulasan(index: filteredItems[index]['index'].toString(), kategori:filteredItems[index]['kategori'].toString() );
                            },));
                          },
                          child: ListTile(
                          title: Text(filteredItems[index]["title"] ?? "Unknown"),    
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
