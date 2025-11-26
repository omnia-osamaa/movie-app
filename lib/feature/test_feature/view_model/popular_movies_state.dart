abstract class PopularMoviesState {}

final class PopularMoviesInitial extends PopularMoviesState {}

final class PopularMoviesLoading extends PopularMoviesState {}

final class PopularMoviesSuccess extends PopularMoviesState {
  PopularMoviesSuccess(this.movies);
  final List<dynamic> movies;
}

final class PopularMoviesError extends PopularMoviesState {
  PopularMoviesError(this.message);
  final String message;
}