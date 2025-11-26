import 'package:movie_app/feature/test_feature/data/model/popular_movies_model.dart';

abstract class PopularMoviesState {}

final class PopularMoviesInitial extends PopularMoviesState {}

final class PopularMoviesLoading extends PopularMoviesState {}

final class PopularMoviesSuccess extends PopularMoviesState {
  PopularMoviesSuccess(this.movies);
  final List<Results> movies;
}

final class PopularMoviesError extends PopularMoviesState {
  PopularMoviesError(this.message);
  final String message;
}