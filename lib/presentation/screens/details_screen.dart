import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinedb/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(movie),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterTitle(movie),
          _Review(movie),
          _Review(movie),
          _Review(movie),
          //CastingCards(movie.id)
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      expandedHeight: 200,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(),
        background: CachedNetworkImage(
          placeholder: (_, __) => Image.asset('assets/placeholder.jpg'),
          errorWidget: (_, __, ___) => Image.asset('assets/placeholder.jpg'),
          imageUrl: movie.posterPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterTitle extends StatelessWidget {
  final Movie movie;

  const _PosterTitle(this.movie);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              placeholder: (_, __) => Image.asset('assets/placeholder.jpg'),
              errorWidget: (_, __, ___) =>
                  Image.asset('assets/placeholder.jpg'),
              imageUrl: movie.posterPath,
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title,
                    style: textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Text(movie.originalTitle,
                    style: textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Row(
                  children: [
                    const Icon(Icons.star_outline,
                        size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text('${movie.voteAverage}', style: textTheme.bodySmall)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Review extends StatelessWidget {
  final Movie movie;

  const _Review(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
