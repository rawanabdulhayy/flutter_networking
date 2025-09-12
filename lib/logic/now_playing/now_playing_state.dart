import 'package:equatable/equatable.dart';

import '../../models/movie.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  //need to send a parameter so that when it's emitting, this value is returned; movies.
  final Movies movies;
  const NowPlayingLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class NowPlayingError extends NowPlayingState {
  //need to send a parameter so that when it's emitting, this value is returned; message.
  final String message;
  const NowPlayingError(this.message);
  @override
  List<Object> get props => [message];
}
