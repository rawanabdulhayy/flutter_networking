import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking/logic/top_rated/top_rated_event.dart';
import 'package:networking/logic/top_rated/top_rated_state.dart';

import '../../models/movie.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvents, TopRatedMoviesStates> {
  final Dio dio;
  TopRatedMoviesBloc(this.dio) : super(TopRatedMoviesInitial()) {
    on<FetchingTopRatedMovies>((event, emit) async {
      emit(TopRatedMoviesLoading());
      try {
        final response = await dio.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=87903828b97a85b50c60fb3bbd960c55",
        );
        if (response.statusCode == 200) {
          // We have to deserialize the raw JSON response into a strongly typed Movies object.
          final deserializedMovieResponse = Movies.fromJson(response.data);
          emit(TopRatedMoviesLoaded(deserializedMovieResponse));
        } else {
          emit(TopRatedMoviesError("Failed"));
        }
      } catch (e) {
        emit(TopRatedMoviesError(e.toString()));
      }
    });
  }
}
