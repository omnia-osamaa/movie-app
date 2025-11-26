import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/result_api.dart';
import 'package:movie_app/feature/test_feature/data/api/popular_movies_api.dart';
import 'package:movie_app/feature/test_feature/data/model/popular_movies_model.dart';
import 'package:movie_app/feature/test_feature/view_model/popular_movies_state.dart';


class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit() : super(PopularMoviesInitial());
  List<Results> movies = [];
  Future<void> getPopularMovies() async {
    emit(PopularMoviesLoading());
    final result = await PopularMoviesApi.getPopularMovies();
    switch (result) {
      case SuccessApi<PopularMoviesModel>():
        emit(PopularMoviesSuccess(result.data.results??[]));
      case ErrorApi<PopularMoviesModel>():
        emit(PopularMoviesError(result.messageError));
      case LoadingApi<PopularMoviesModel>():
        emit(PopularMoviesLoading());
    }
  }
}
