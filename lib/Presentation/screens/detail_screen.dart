import 'package:flutter/material.dart';
import 'package:networking/models/movie.dart';

class DetailScreen extends StatelessWidget {
  /*
   * Previously we allowed `movie` to be nullable when we wanted to include
   * `DetailScreen` inside the MainPage pages list (because we had to pass null there).
   * In that case, we accessed it with a null-check (`!`) inside build to assume non-null.
   *
   * Example of that approach:
   *   final Movie? movie;
   *   const DetailScreen({super.key, this.movie});
   *
   *   @override
   *   Widget build(BuildContext context) {
   *     final m = movie!; // assume movie is not null for now
   *   }
   *
   * In this version, we require the `movie` explicitly (non-nullable).
   */
  final Movie movie;
  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
       * Q1: Why does this screen cover the AppBar/status bar space automatically,
       *      unlike the HomePage where we had to use MediaQuery.removePadding?
       *
       * → In HomePage, we used a ListView. By default, ListView inserts top padding
       *   to account for the system UI (status bar, notch). This is why we had to
       *   explicitly remove it with MediaQuery.removePadding.
       *
       * → In DetailScreen, we use a SingleChildScrollView + Column. Column does not
       *   add that padding by default, so content begins at the very top of the screen.
       *
       * TL;DR:
       *   - ListView = auto top padding.
       *   - Column (even inside SingleChildScrollView) = no auto padding.
       */
      backgroundColor: Colors.black,

      /*
       * Q2: Why wrap Column inside SingleChildScrollView?
       *
       * → Column itself does not support scrolling. If the content is taller than
       *   the screen, it will overflow (yellow/black striped warning in debug).
       *
       * → Wrapping Column in a SingleChildScrollView allows the entire column to
       *   scroll when needed.
       *
       * Roles:
       *   - Column = vertical arrangement of widgets.
       *   - SingleChildScrollView = makes that arrangement scrollable.
       *
       * Note: A ListView could also handle both layout + scrolling in one widget.
       *       Here, SingleChildScrollView + Column gives finer layout control.
       */
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster / Backdrop image
            ClipRRect(
              // Alternative: BorderRadius.only(...) instead of BorderRadius.circular()
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                movie.backdropPath ?? "assets/images/titanic.jpg",
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Duration & Rating row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.white70, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    "152 minutes", // Currently hardcoded, as duration is not part of Movie model
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    /*
                     * Q3: When to use `$` vs `${}` in strings?
                     *
                     * → Both are string interpolation (inserting values into strings).
                     *
                     *   $variable → for simple variable references:
                     *     "Hello $name"
                     *
                     *   ${expression} → for more complex references (properties, methods, calculations):
                     *     "My age is ${user.age}"
                     *     "Total: ${price * quantity}"
                     *
                     * In this case:
                     *   "${movie.voteAverage} (IMDb)"
                     * is needed because `movie.voteAverage` is a property access, not just a plain variable.
                     */
                    "${movie.voteAverage} (IMDb)",
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Genre (hardcoded, since Movie model only has genreIds for now)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Genre: Action",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),

            const SizedBox(height: 16),

            // Description header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Description",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Overview
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                movie.overview,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.white70,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Related movies header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Related Movies",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Related movies (temporary placeholders)
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRelatedMovie("assets/images/titanic.jpg"),
                  _buildRelatedMovie("assets/images/titanic.jpg"),
                  _buildRelatedMovie("assets/images/titanic.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Utility function for building a related movie thumbnail
  Widget _buildRelatedMovie(String path) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(path, width: 100, fit: BoxFit.cover),
      ),
    );
  }
}
