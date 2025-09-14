abstract class RelatedMoviesEvent {}

class FetchRelatedMovies extends RelatedMoviesEvent {
  final List<int> genreIds;
  FetchRelatedMovies(this.genreIds);
}
