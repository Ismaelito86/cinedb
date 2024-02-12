import 'package:cinedb/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.43,
      child: PageView.builder(
        itemCount: movies.length,
        //layout: SwiperLayout.STACK,
        //itemWidth: size.width * 0.6,
        //itemHeight: size.height * 0.4,
        itemBuilder: (_, int index) {
          final movie = movies[index];

          //movie.id = int.parse('swiper-${movie.id}');

          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.id,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: movie.backdropPath,
                      placeholder: (_, __) =>
                          Image.asset('assets/placeholder.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.transparent,
                          Theme.of(context).colorScheme.background,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    bottom: 10,
                    child: SizedBox(
                      width: 300,
                      child: Opacity(
                        opacity: 0.8,
                        child: Text(
                          movie.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
