import 'package:flutter/material.dart';
import 'package:networking/models/movie.dart';

class DetailScreen extends StatelessWidget {
  final Movie? movie;
  const DetailScreen({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
