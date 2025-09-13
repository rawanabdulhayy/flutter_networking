import 'package:equatable/equatable.dart';

abstract class TopRatedMoviesEvents extends Equatable {
  const TopRatedMoviesEvents();
  //the base class of events is the one which implements the props beforehand.
  @override
  List<Object> get props => [];
}

class FetchingTopRatedMovies extends TopRatedMoviesEvents{}