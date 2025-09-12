import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../models/movie.dart';
import 'now_playing_event.dart';
import 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final Dio dio;
  //super takes the state of the parent widget.
  NowPlayingBloc(this.dio) : super(NowPlayingInitial()) {
    on<FetchNowPlayingMovies>((event, emit) async{
      emit(NowPlayingLoading());
      try{
        //request, endpoint path passed in a get/post function through dio's object.
        //async await block awaits the dio's response.
        final response = await dio.get("https://api.themoviedb.org/3/movie/now_playing?api_key=87903828b97a85b50c60fb3bbd960c55");
        if(response.statusCode == 200){
          //1- a3mel t7wel l from json
          final movieResponse = Movies.fromJson(response.data);
          //2- emit the loaded success state, returns the converted json variable
          emit(NowPlayingLoaded(movieResponse));
        }
        else{
          emit(NowPlayingError("Failed"));
        }
      }
      catch (e){
        emit(NowPlayingError(e.toString()));
      }
    });
  }
}
