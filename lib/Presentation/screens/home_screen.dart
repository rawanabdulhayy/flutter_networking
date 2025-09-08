import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:networking/Presentation/widgets/now_playing_widget.dart';
import 'package:networking/Presentation/widgets/popular_movies.dart';
import 'package:networking/Presentation/widgets/top_rated.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(children: [NowPlayingWidget(), PopularMovies(), TopRated(), ]),
      ),
    );
  }
}
