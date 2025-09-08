/*
=====================================================
        🔹 copy vs copyWith in Dart & Flutter
=====================================================

1) copy (List.from, Map.from, etc.)
-----------------------------------
- Built into Dart collections (List, Map, Set).
- Creates a NEW collection object with the same elements.
- Purpose: duplication, not modification.

Example:
  var list1 = [1, 2, 3];
  var list2 = List.from(list1);

  print(list1 == list2); // false → different objects
  list2.add(4);

  list1 → [1, 2, 3]
  list2 → [1, 2, 3, 4]

✅ Use when you want the same data but in a new collection,
   so modifying one won’t affect the other.

-----------------------------------------------------

2) copyWith (custom model method)
-----------------------------------
- Not built-in → you usually write it yourself in model classes.
- Returns a NEW object while letting you override SOME fields.
- Other fields remain unchanged.
- Keeps your models IMMUTABLE (never modify the original object).

Example:
  class Movie {
    final String title;
    final double rating;

    Movie({required this.title, required this.rating});

    Movie copyWith({String? title, double? rating}) {
      return Movie(
        title: title ?? this.title,
        rating: rating ?? this.rating,
      );
    }
  }

  var movie1 = Movie(title: "Inception", rating: 9.0);
  var movie2 = movie1.copyWith(rating: 8.5);

  movie1 → {title: Inception, rating: 9.0}
  movie2 → {title: Inception, rating: 8.5}

✅ Use when you want to update only certain fields
   but keep everything else untouched.

-----------------------------------------------------

3) Why copyWith is ESSENTIAL in Flutter State Management
--------------------------------------------------------
- State classes in Flutter (Bloc, Provider, Riverpod, etc.)
  are often immutable.
- Instead of mutating the state, we emit a NEW state object.
- copyWith makes it easy → override just what’s changed.

Example (Cubit/Bloc):

  class MovieState {
    final bool isLoading;
    final List<Movie> movies;
    final String? errorMessage;

    MovieState({
      required this.isLoading,
      required this.movies,
      this.errorMessage,
    });

    MovieState copyWith({
      bool? isLoading,
      List<Movie>? movies,
      String? errorMessage,
    }) {
      return MovieState(
        isLoading: isLoading ?? this.isLoading,
        movies: movies ?? this.movies,
        errorMessage: errorMessage ?? this.errorMessage,
      );
    }
  }

Usage in Cubit:
  emit(state.copyWith(isLoading: true));         // only change isLoading
  emit(state.copyWith(movies: fetchedMovies));   // only change movies
  emit(state.copyWith(errorMessage: "Oops!"));   // only change error

❌ Without copyWith:
  emit(MovieState(
    isLoading: false,
    movies: state.movies,        // must manually copy unchanged fields
    errorMessage: "Oops!",
  ));

-----------------------------------------------------

🔑 Mental model:
- copy = duplicate the whole thing into a new box.
- copyWith = duplicate, but tweak only what you want.

=====================================================
*/
