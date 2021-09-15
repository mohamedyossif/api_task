class Movie {
  String? poster_path, title, release_date;
  var vote_average;
  Movie({required this.poster_path,required this.title,required this.release_date,required this.vote_average});
  factory Movie.fromMap(Map<String, dynamic> map) {
  return Movie(  
    poster_path : map['poster_path'],
    title : map['title'],
    release_date : map['release_date'],
    vote_average : map['vote_average'],
  );
  }
}
