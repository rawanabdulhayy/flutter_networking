import 'package:equatable/equatable.dart';
import 'package:networking/models/movie.dart';

abstract class TopRatedMoviesStates extends Equatable {
  const TopRatedMoviesStates();
  @override
  List<Object?> get props => [];
}
class TopRatedMoviesInitial extends TopRatedMoviesStates{}
class TopRatedMoviesLoading extends TopRatedMoviesStates{}
class TopRatedMoviesLoaded extends TopRatedMoviesStates{
  //the state needs to send a parameter so that when it's emitting, this value is returned; movies.
  //and then pass it to the equatable's props for comparing by values.
  final Movies movies;
  const TopRatedMoviesLoaded(this.movies);
  @override
  List<Object?> get props => [movies];
}
class TopRatedMoviesError extends TopRatedMoviesStates{
  //the state needs to send a parameter so that when it's emitting, this value is returned; error message.
  //and then pass it to the equatable's props for comparing by values.
  final String errorMessage;
  const TopRatedMoviesError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

