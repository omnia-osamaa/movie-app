import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/core/network/result_api.dart';
import 'package:movie_app/core/utils/app_apis.dart';
import 'package:movie_app/feature/test_feature/data/model/popular_movies_model.dart';

class PopularMoviesApi {
  static Future<ResultApi<PopularMoviesModel>> getPopularMovies() async {
    Uri url = Uri.https(
      AppApis.baseUrl,
      AppApis.popularMovieUrl,
      {
        'api_key': AppApis.apiKey,
      },
    );
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var data = PopularMoviesModel.fromJson(json);
      return SuccessApi<PopularMoviesModel>(data);
    } catch (e) {
      return ErrorApi<PopularMoviesModel>(e.toString());
    }
  }
}
