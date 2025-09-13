import 'package:equatable/equatable.dart';
import 'package:networking/models/movie.dart';

abstract class PopularMoviesStates extends Equatable {
  const PopularMoviesStates();
  @override
  List<Object?> get props => [];
}
class PopularMoviesInitial extends PopularMoviesStates{}
class PopularMoviesLoading extends PopularMoviesStates{}
class PopularMoviesLoaded extends PopularMoviesStates{
  //the state needs to send a parameter so that when it's emitting, this value is returned; movies.
  //and then pass it to the equatable's props for comparing by values.
  final Movies movies;
  const PopularMoviesLoaded(this.movies);
  @override
  List<Object?> get props => [movies];
}
class PopularMoviesError extends PopularMoviesStates{
  //the state needs to send a parameter so that when it's emitting, this value is returned; error message.
  //and then pass it to the equatable's props for comparing by values.
  final String errorMessage;
const PopularMoviesError(this.errorMessage);

@override
  List<Object?> get props => [errorMessage];
}

