class tReview {
  final String kategori;
  final String index;
  List<Review> comments; 

  tReview({required this.index, required this.kategori, required this.comments});
}

class Review {
  final String username;
  final String comment;
  final int rating;

  Review({required this.username, required this.comment, required this.rating});
}

List<tReview> reviews = [


  tReview(
    kategori: "1",
    index: "1",
    comments: [
               Review(username: "Hendra Wijaya", comment: "Pemandangannya luar biasa, namun agak ramai saat akhir pekan.", rating: 4),
              Review(username: "Sari Fitriani", comment: "Tempatnya indah, tapi ada beberapa area yang perlu perawatan lebih.", rating: 3),
              Review(username: "Budi Nugroho", comment: "Fasilitasnya cukup baik, tetapi harus ada lebih banyak tempat duduk untuk pengunjung.", rating: 3),
              Review(username: "Lina Amelia", comment: "Sky Bridge memberikan pemandangan yang sangat menakjubkan, cocok untuk foto-foto.", rating: 5),
              Review(username: "Rudi Hartono", comment: "Tempat ini sangat menyenangkan, tetapi jalan menuju Sky Bridge kurang terawat.", rating: 4),
              Review(username: "Anisa Pratiwi", comment: "Lokasi strategis, namun kebersihannya masih perlu ditingkatkan.", rating: 3),
    ],
  ),
  tReview(
    kategori: "1",
    index: "2",
    comments: [
        Review(username: "Fadli Pratama", comment: "Sangat menantang dan seru! Hanya saja sedikit menunggu lama untuk giliran.", rating: 4),
        Review(username: "Dewi Setiawati", comment: "Sensasi yang luar biasa, namun tempat pendaratannya agak kurang aman.", rating: 3),
        Review(username: "Reza Aditya", comment: "Seru sekali! Pengalaman yang tidak terlupakan, tapi pengaturan antreannya perlu diperbaiki.", rating: 4),
        Review(username: "Tina Mahardika", comment: "Menyenangkan, tapi kecewa dengan waktu tunggu yang sangat lama.", rating: 3),
        Review(username: "Suci Rahayu", comment: "Adrenalin tinggi, pengalaman yang sangat seru, hanya saja perawatan fasilitas bisa lebih baik.", rating: 4),
        Review(username: "Tomi Wijaya", comment: "Pengalaman yang sangat seru dan memacu adrenalin! Pasti akan kembali!", rating: 5),
        Review(username: "Ika Pratiwi", comment: "Sangat menantang dan seru, namun cukup menunggu lama dan fasilitasnya bisa lebih terawat.", rating: 3),
        Review(username: "Rini Mahendra", comment: "Tempat yang sangat menyenangkan dan aman, pasti akan mencoba lagi!", rating: 5),
        Review(username: "Dian Fitria", comment: "Seru dan menguji adrenalin, meskipun sedikit menakutkan bagi saya.", rating: 4),
        Review(username: "Agus Supriyanto", comment: "Keren banget! Namun perlu lebih banyak staf untuk mengatur antrean dengan lebih cepat.", rating: 4),

    ],
  ),
  tReview(
    kategori: "1",
    index: "3",
    comments: [
      Review(username: "Rudi Santoso", comment: "Seru banget! Sensasi terbangnya luar biasa, hanya saja sedikit antri.", rating: 4),
      Review(username: "Maya Putri", comment: "Pengalaman yang mengasyikkan, tapi pengaturan antreannya perlu diperbaiki.", rating: 3),
      Review(username: "Budi Setiawan", comment: "Flying fox sangat seru, pemandangannya indah, meskipun fasilitas pendaratannya perlu perhatian lebih.", rating: 4),
      Review(username: "Tina Amalia", comment: "Sensasi flying fox sangat menyenangkan, tapi waktu tunggu terlalu lama.", rating: 3),
      Review(username: "Agus Hartanto", comment: "Tempatnya menyenangkan dan adrenalin yang tinggi! Pasti akan mencoba lagi.", rating: 5),
      Review(username: "Nina Sari", comment: "Pengalaman yang seru, namun sedikit menunggu lama. Secara keseluruhan, cukup memuaskan.", rating: 4),

    ],
  ),
  tReview(
    kategori: "1",
    index: "4",
    comments: [
    Review(username: "Agus Pratama", comment: "Seru banget! Wahana ini cocok untuk keluarga, tapi agak ramai saat weekend.", rating: 4),
    Review(username: "Rina Puspita", comment: "Pengalaman menyenangkan, namun sedikit antri. Pemandangan sekitar sangat indah.", rating: 4),
    Review(username: "Dian Prasetyo", comment: "Cukup seru, namun agak sulit mencari tempat duduk di sekitar area.", rating: 3),
    Review(username: "Siti Lestari", comment: "Wahana yang sangat menyenangkan, cocok untuk anak-anak. Hanya saja pengaturannya perlu lebih baik.", rating: 4),
    Review(username: "Budi Hartono", comment: "Suasananya seru, tetapi wahana bisa lebih aman dan lebih terawat.", rating: 3),
    Review(username: "Maya Cahyani", comment: "Tempatnya seru banget! Saya sangat menikmati pengalaman ini dan pasti akan kembali.", rating: 5),

    ],
  ),


  tReview(
    kategori: "2",
    index: "1",
    comments: [
       Review(username: "Fajar Pratama", comment: "Wahana yang seru, namun bisa lebih terorganisir dengan baik. Anak-anak sangat suka.", rating: 4),
      Review(username: "Lina Santika", comment: "Tempatnya asyik, tapi terlalu ramai saat liburan. Fasilitas cukup baik.", rating: 3),
      Review(username: "Rizky Nugroho", comment: "Cukup menyenangkan, tapi harga tiket agak mahal untuk fasilitas yang diberikan.", rating: 3),
      Review(username: "Siti Arini", comment: "Suasana menyenangkan, cocok untuk keluarga. Hanya saja antrinya cukup lama.", rating: 4),
      Review(username: "Dian Suryani", comment: "Anak-anak sangat menikmatinya, tetapi tempat parkir sangat terbatas.", rating: 3),
      Review(username: "Budi Ramadhan", comment: "Tempat yang sangat cocok untuk keluarga. Fasilitas terawat dengan baik dan banyak pilihan aktivitas.", rating: 5),
          ],
  ),
  tReview(
    kategori: "2",
    index: "2",
    comments: [
      Review(username: "Lina Fitria", comment: "Tempatnya menyenangkan dan aman untuk anak-anak, hanya saja sedikit ramai saat liburan.", rating: 4),
      Review(username: "Sandi Pratama", comment: "Anak-anak sangat senang di sini, tapi fasilitas makanan bisa ditingkatkan.", rating: 3),
      Review(username: "Diana Puspita", comment: "Puas dengan fasilitasnya, anak-anak bisa bermain dengan bebas dan aman.", rating: 5),
      Review(username: "Andi Prasetyo", comment: "Cukup menyenangkan, tetapi perlu lebih banyak permainan untuk anak-anak lebih besar.", rating: 4),
      Review(username: "Rani Sari", comment: "Tempat yang bagus dan cocok untuk keluarga, namun kebersihannya perlu lebih diperhatikan.", rating: 3),
        ],
  ),
  tReview(
    kategori: "3",
    index: "1",
    comments: [
      Review(username: "Dina Putri", comment: "Makanan enak dan pilihan banyak, namun sedikit mahal.", rating: 4),
      Review(username: "Budi Kurniawan", comment: "Tempatnya nyaman, tetapi kebersihannya masih bisa ditingkatkan.", rating: 3),
      Review(username: "Eka Ramadhani", comment: "Sangat puas dengan makanan dan pelayanan yang cepat. Pasti akan kembali!", rating: 5),
      Review(username: "Rina Wijaya", comment: "Pilihan makanannya banyak, namun beberapa menu kurang lezat.", rating: 3),
        ],
  ),
  tReview(
    kategori: "3",
    index: "2",
    comments: [
      Review(username: "Mira Santoso", comment: "Cocok untuk nongkrong santai, makanan enak dengan harga terjangkau.", rating: 4),
      Review(username: "Budi Hartono", comment: "Makanan yang enak dan suasana yang nyaman, hanya saja agak ramai saat malam.", rating: 4),
      Review(username: "Siti Nurhaliza", comment: "Tempat yang menyenangkan dengan pilihan makanan tradisional yang lezat.", rating: 5),
      Review(username: "Toni Satria", comment: "Pelayanan agak lambat, tapi makanan dan suasananya sangat memuaskan.", rating: 3),

    ],
  ),

];

