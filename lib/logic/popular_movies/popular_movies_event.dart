import 'package:equatable/equatable.dart';

abstract class PopularMoviesEvents extends Equatable {
  //the base class of events is the one which implements the props beforehand.
  @override
  List<Object> get props => [];

}

class FetchingPopularMovies extends PopularMoviesEvents{

}