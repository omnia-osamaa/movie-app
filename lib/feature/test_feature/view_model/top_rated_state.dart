import 'package:movie_app/feature/test_feature/data/model/top_rated_movies_model.dart';

abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoading extends TopRatedState {}

class TopRatedSuccess extends TopRatedState {
  TopRatedSuccess(this.movies);
  final List<Results> movies;
}

class TopRatedError extends TopRatedState {
  TopRatedError(this.message);
  final String message;
}
