import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/network/result_api.dart';
import 'package:movie_app/core/utils/app_apis.dart';
import 'package:movie_app/feature/test_feature/data/model/top_rated_movies_model.dart';

class TopRatedMoviesApi {
  static Future<ResultApi<TopRatedMoviesModel>> getTopRatedMoviesModel() async {
    Uri url = Uri.https(
      AppApis.baseUrl,
      AppApis.topRatedUrl,
      {
        'api_key': AppApis.apiKey,
      },
    );
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var data = TopRatedMoviesModel.fromJson(json);
      return SuccessApi<TopRatedMoviesModel>(data);
    } catch (e) {
      return ErrorApi<TopRatedMoviesModel>(e.toString());
    }
  }
}
