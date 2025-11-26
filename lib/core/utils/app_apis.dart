abstract class AppApis {
  static const baseUrl = 'api.themoviedb.org';
  static const apiKey = '9d7f94be913eddf2db40e317d2f12f36';
  static String imageBaseUrl = "https://image.tmdb.org/t/p/w500";

  //api.themoviedb.org/3/movie/top_rated?api_key=9d7f94be913eddf2db40e317d2f12f36
  static const topRatedUrl = '/3/movie/top_rated';

  //api.themoviedb.org/3/movie/popular?api_key=9d7f94be913eddf2db40e317d2f12f36
  static const popularMovieUrl = '/3/movie/popular';
}
