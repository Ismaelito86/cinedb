import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:cinedb/presentation/providers/movies_provider.dart';
import 'package:cinedb/presentation/widgets/widgets.dart';

class MovieScreen extends StatelessWidget {
  final int? pageIndex;
  const MovieScreen({super.key, this.pageIndex});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      //backgroundColor: ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tarjetas principales
            CardSwiper(movies: moviesProvider.nowPlayingMovies),
            const SizedBox(
              height: 50,
            ),
            // Slider de películas
            MoviesCardSlider(
              movies: moviesProvider.popularMovies, // populares,
              title: 'Populares', // opcional
              nextPage: () => moviesProvider.getPopularMovies(),
            ),
            const SizedBox(
              height: 25,
            ),
            MoviesCardSlider(
              movies: moviesProvider.topRatedMovies, // populares,
              title: 'Top Rated', // opcional
              nextPage: () => moviesProvider.getTopRatedMovies(),
            ),
            const SizedBox(
              height: 25,
            ),
            MoviesCardSlider(
              movies: moviesProvider.upcomingMovies, // populares,
              title: 'Proximamente', // opcional
              nextPage: () => moviesProvider.getUpcomingMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
