import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../models/movie.dart';
import 'now_playing_event.dart';
import 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final Dio dio;
  // `super(...)` calls the parent Bloc constructor with that state; state of the parent widget.
  NowPlayingBloc(this.dio) : super(NowPlayingInitial()) {

    // On <event> -- an event handler for the FetchNowPlayingMovies event.
    // Whenever this event is dispatched, the provided callback executes.
    on<FetchNowPlayingMovies>((event, emit) async {
      emit(NowPlayingLoading());

      try {
        // Perform an asynchronous GET request using Dio to fetch "now playing" movies.
        // The request is awaited so execution pauses until the response is returned.
        final response = await dio.get(
            "https://api.themoviedb.org/3/movie/now_playing?api_key=87903828b97a85b50c60fb3bbd960c55"
        );

        // Check http status code for success or failure.
        if (response.statusCode == 200) {
          // Deserialize the raw JSON response into a strongly typed Movies object.
          final movieResponse = Movies.fromJson(response.data);
          emit(NowPlayingLoaded(movieResponse));
        } else {
          emit(NowPlayingError("Failed"));
        }
      } catch (e) {
        emit(NowPlayingError(e.toString()));
      }
    });
  }
}
