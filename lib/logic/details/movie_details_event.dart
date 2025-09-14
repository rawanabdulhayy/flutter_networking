import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
  //the base class of events is the one which implements the props beforehand.
  @override
  List<Object> get props => [];
}

class FetchMovieDetails extends MovieDetailsEvent{
  //wana bb3t event, bb3t m3ah id
  //bb3t event add, fa yru7 y check flbloc mfrud y3mel eh f by emit state, bst2bl state, reflected in ui

  final int movieId;
  const FetchMovieDetails(this.movieId);
  @override
  List<Object> get props => [movieId];
}