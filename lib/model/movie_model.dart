class Movie {
  int id;
  String title;
  String overview;
  // String original_language;
  // double budget;
  // double revenue;
  double vote_average;
  // String status;
  String release_date;
  String poster_path;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    // required this.original_language,
    // required this.budget,
    // required this.revenue,
    required this.vote_average,
    // required this.status,
    required this.release_date,
    required this.poster_path,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      // original_language: json['original_language'],
      // budget: double.parse(json['budget'].toString()),
      // revenue: double.parse(json['revenue'].toString()),
      vote_average: double.parse(json['vote_average'].toString()),
      // status: json['status'],
      release_date: json['release_date'],
      poster_path: json['poster_path'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        // 'overview': overview,
        // 'original_language': original_language,
        // 'budget': budget,
        // 'revenue': revenue,
        'vote_average': vote_average,
        // 'status': status,
        'release_date': release_date,
        'poster_path': poster_path,
      };
}
