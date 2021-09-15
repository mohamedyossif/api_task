import 'package:api_task_iti/model/movie.dart';
import 'package:dio/dio.dart';

String api_key = '837aa67b269303622a476bbe24283a57';
String uri = 'https://api.themoviedb.org/3/movie/popular?api_key=${api_key}';

class Networking {
  static Future<List<Movie>> getData() async {
    Response response = await Dio().get(uri);
    if (response.statusCode == 200) {
      return response.data['results']
          .map<Movie>((e) => Movie.fromMap(e))
          .toList();
    } else {
      throw ' error';
    }
  }
}
