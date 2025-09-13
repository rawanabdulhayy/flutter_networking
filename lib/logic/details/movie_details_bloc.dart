import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking/models/details_model.dart';

import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final Dio dio;
  MovieDetailsBloc(this.dio) : super(MovieDetailsInitial()) {
    on<FetchMovieDetails>((event, emit) async {
      emit(MovieDetailsLoading());
      try {
        final response = await dio.get(
          "https://api.themoviedb.org/3/movie/${event.movieId}?api_key=87903828b97a85b50c60fb3bbd960c55",
        );
        if (response.statusCode == 200){
          final movieDetails = MovieDetails.fromJson(response.data);
          emit(MovieDetailsLoaded(movieDetails));
        }
        else {
          emit(MovieDetailsError("Failed to Load Movie Details."));
        }
      } catch (e) {
        emit(MovieDetailsError(e.toString()));
      }
    });
  }
}
