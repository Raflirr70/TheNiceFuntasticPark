import 'package:flutter/material.dart';
import 'package:the_nice_funstantic_park/data/dprofile.dart';
import 'package:the_nice_funstantic_park/data/list_komentar.dart';
class AllCommentsPage extends StatefulWidget {
  final String index;
  final String kategori;

  const AllCommentsPage(
      {super.key, required this.index, required this.kategori});

  @override
  State<AllCommentsPage> createState() => _AllCommentsPageState();
}

class _AllCommentsPageState extends State<AllCommentsPage> {
  final TextEditingController _commentController = TextEditingController();
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    final tReview reviewData = reviews.firstWhere(
      (review) => review.index == widget.index && review.kategori == widget.kategori,
      orElse: () => tReview(index: widget.index, kategori: widget.kategori, comments: []),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Semua Ulasan")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          
          children: [
            Expanded(
              child: reviewData.comments.isEmpty
                  ? const Center(child: Text('Belum ada ulasan.'))
                  : ListView(
                      children: reviewData.comments
                          .map((review) => ulasanCard(review))
                          .toList(),
                    ),
            ),
            const SizedBox(height: 20),
            const Text("Tambahkan Ulasan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
             
              children: List.generate(
                5,
                (index) => IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    color: index < _rating ? Colors.amber : Colors.grey,
                  ),
                ),
              ),
            ),
            TextField(
              controller: _commentController,
              decoration: const InputDecoration(
                labelText: "Ulasan Anda",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
           Align(alignment: Alignment.bottomRight,child: GestureDetector(
            onTap:  () {
                if (_commentController.text.isNotEmpty && _rating > 0) {
                  setState(() {
                    reviewData.comments.add(
                      Review(
                        username:profile.isi[1] , 
                        comment: _commentController.text,
                        rating: _rating,
                      ),
                    );
                    _commentController.clear();
                    _rating = 0;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Komentar berhasil ditambahkan"),duration: Duration(seconds: 3),),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Harap isi komentar dan beri rating",), duration: Duration(seconds: 3),),
                  );
                }
              },
              child: Container(
                width: 100, 
                height: 30,
                decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5)),
                child:const Center(child:  Text("Kirim",style:TextStyle(color: Colors.white),),) ,
              ),
           ),
           )
          ],
        ),
      ),
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
}
