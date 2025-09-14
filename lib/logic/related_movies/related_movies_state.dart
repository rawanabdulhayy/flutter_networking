import '../../models/movie.dart';

abstract class RelatedMoviesState {}

class RelatedMoviesInitial extends RelatedMoviesState {}
class RelatedMoviesLoading extends RelatedMoviesState {}
class RelatedMoviesLoaded extends RelatedMoviesState {
  final Movies movies;
  RelatedMoviesLoaded(this.movies);
}
class RelatedMoviesError extends RelatedMoviesState {
  final String message;
  RelatedMoviesError(this.message);
}
