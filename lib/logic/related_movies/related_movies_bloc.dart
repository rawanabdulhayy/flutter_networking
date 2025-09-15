//-------What would have happened have we not have made the Movies class-------
// final List<Movie> movies = (response.data['results'] as List)
//     .map((json) => Movie.fromJson(json))
//     .toList();

// response.data is a Map<String, dynamic>, not a Movies.
// which is why we need a converter method; fromJson that takes the map and converts it into the class type.
// final movies = Movies.fromJson(response.data);

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking/logic/related_movies/related_movies_event.dart';
import 'package:networking/logic/related_movies/related_movies_state.dart';
import '../../models/movie.dart';


class RelatedMoviesBloc extends Bloc<RelatedMoviesEvent, RelatedMoviesState> {
  final Dio dio;

  // Constructor: provide the dio instance and set the initial state.
  RelatedMoviesBloc(this.dio) : super(RelatedMoviesInitial()) {

    on<FetchRelatedMovies>((event, emit) async {
      emit(RelatedMoviesLoading());

      try {
        final genreQuery = event.genreIds.join(",");
        final response = await dio.get(
          "https://api.themoviedb.org/3/discover/movie",
          queryParameters: {
            // TODO: move API key out of source.
            "api_key": "87903828b97a85b50c60fb3bbd960c55",
            "with_genres": genreQuery,
          },
        );
        final movies = Movies.fromJson(response.data);
        emit(RelatedMoviesLoaded(movies));
      } catch (e) {
        emit(RelatedMoviesError(e.toString()));
      }
    });
  }
}
