import 'package:flutter/material.dart';
import 'package:networking/Presentation/screens/detail_screen.dart';
import '../../models/movie.dart';

class PopularMovies extends StatelessWidget {
  PopularMovies({super.key});

  final List<Movie> dummyMovies = [
    Movie(
      adult: false,
      backdropPath: "assets/images/titanic.jpg",
      genreIds: [28, 12, 16],
      id: 1,
      originalLanguage: "en",
      originalTitle: "Dummy Original Title 1",
      overview: "This is a short overview for movie 1. It's just a dummy description.",
      popularity: 123.45,
      posterPath: "/dummy_poster1.jpg",
      releaseDate: "2025-01-01",
      title: "Dummy Movie 1",
      video: false,
      voteAverage: 7.8,
      voteCount: 100,
    ),
    Movie(
      adult: false,
      backdropPath: "assets/images/titanic.jpg",
      genreIds: [35, 18],
      id: 2,
      originalLanguage: "fr",
      originalTitle: "Dummy Original Title 2",
      overview: "This is a short overview for movie 2. Just some testing data.",
      popularity: 88.9,
      posterPath: "/dummy_poster2.jpg",
      releaseDate: "2024-12-15",
      title: "Dummy Movie 2",
      video: false,
      voteAverage: 6.4,
      voteCount: 55,
    ),
    Movie(
      adult: true,
      backdropPath: "assets/images/titanic.jpg",
      genreIds: [27, 53],
      id: 3,
      originalLanguage: "es",
      originalTitle: "Dummy Original Title 3",
      overview: "This is a horror/thriller dummy movie used for testing.",
      popularity: 200.1,
      posterPath: "/dummy_poster3.jpg",
      releaseDate: "2025-02-20",
      title: "Dummy Movie 3",
      video: false,
      voteAverage: 8.2,
      voteCount: 300,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Text("Popular on Netflix", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700, color: Colors.white),),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyMovies.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = dummyMovies[index];
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GestureDetector(
                    child: Image.asset(movie.backdropPath!),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(movie: movie,)));
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
