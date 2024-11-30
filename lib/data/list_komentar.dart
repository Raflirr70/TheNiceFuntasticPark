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
      Review(username: "John Doe", comment: "Great place! Had a wonderful time.", rating: 5),
      Review(username: "Jane Smith", comment: "Not bad, but could use more activities.", rating: 3),
      Review(username: "Alex Johnson", comment: "Amazing experience, highly recommend!", rating: 4),
    ],
  ),
  tReview(
    kategori: "1",
    index: "2",
    comments: [
      Review(username: "Emily Davis", comment: "Disappointing, service was poor.", rating: 2),
      Review(username: "Michael Brown", comment: "Absolutely loved it. Will come back again!", rating: 5),
    ],
  ),
  tReview(
    kategori: "1",
    index: "3",
    comments: [
      Review(username: "Chris Wilson", comment: "Nice ambiance but a bit crowded.", rating: 4),
      Review(username: "Anna White", comment: "Loved the view and the activities.", rating: 5),
    ],
  ),


  tReview(
    kategori: "2",
    index: "1",
    comments: [
      Review(username: "Daniel Green", comment: "Good place for families.", rating: 4),
      Review(username: "Sarah Black", comment: "Too expensive for what it offers.", rating: 2),
    ],
  ),
  tReview(
    kategori: "2",
    index: "2",
    comments: [
      Review(username: "Oliver Gray", comment: "Had a blast, great for kids!", rating: 5),
      Review(username: "Sophia Blue", comment: "Could use better food options.", rating: 3),
    ],
  ),
  tReview(
    kategori: "2",
    index: "3",
    comments: [
      Review(username: "Ethan Red", comment: "Amazing park, clean and fun.", rating: 5),
      Review(username: "Emma Purple", comment: "The staff were very helpful.", rating: 4),
    ],
  ),


  tReview(
    kategori: "3",
    index: "1",
    comments: [
      Review(username: "Lucas Yellow", comment: "Fantastic place, well maintained.", rating: 5),
      Review(username: "Mia Orange", comment: "The rides were thrilling!", rating: 4),
    ],
  ),
  tReview(
    kategori: "3",
    index: "2",
    comments: [
      Review(username: "William Brown", comment: "Not worth the hype.", rating: 2),
      Review(username: "Isabella Pink", comment: "Fun day out, great for families.", rating: 4),
    ],
  ),
  tReview(
    kategori: "3",
    index: "3",
    comments: [
      Review(username: "James Violet", comment: "Loved it! The park was huge and had many attractions.", rating: 5),
      Review(username: "Charlotte Cyan", comment: "Could use better facilities.", rating: 3),
    ],
  ),
];

