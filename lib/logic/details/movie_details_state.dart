import 'package:equatable/equatable.dart';
import 'package:networking/models/details_model.dart';

abstract class MovieDetailsState extends Equatable{
  const MovieDetailsState();
  @override
  List<Object?> get props => [];
}
class MovieDetailsInitial extends MovieDetailsState{}
class MovieDetailsLoading extends MovieDetailsState{}
class MovieDetailsLoaded extends MovieDetailsState{
  final MovieDetails movieDetails;

  const MovieDetailsLoaded(this.movieDetails);

  @override
  List<Object?> get props => [movieDetails];
}
class MovieDetailsError extends MovieDetailsState{
  final String message;

  const MovieDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}