import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking/logic/popular_movies/popular_movies_event.dart';
import 'package:networking/logic/popular_movies/popular_movies_state.dart';
import 'package:networking/models/movie.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvents, PopularMoviesStates> {
  final Dio dio;

  PopularMoviesBloc(this.dio) : super(PopularMoviesInitial()) {
    on<FetchingPopularMovies>((event, emit) async {
      emit(PopularMoviesLoading());
      try {
        final response = await dio.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=87903828b97a85b50c60fb3bbd960c55",
        );
        if (response.statusCode == 200) {
          // We have to deserialize the raw JSON response into a strongly typed Movies object.
          final deserializedMovieResponse = Movies.fromJson(response.data);
          emit(PopularMoviesLoaded(deserializedMovieResponse));
        } else {
          emit(PopularMoviesError("Failed"));
        }
      } catch (e) {
        emit(PopularMoviesError(e.toString()));
      }
    });
  }
}
