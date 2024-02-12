import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinedb/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesCardSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function nextPage;

  const MoviesCardSlider({
    Key? key,
    required this.movies,
    required this.nextPage,
    this.title,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MoviesCardSliderState createState() => _MoviesCardSliderState();
}

class _MoviesCardSliderState extends State<MoviesCardSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.nextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.title!,
                  style: Theme.of(context).textTheme.titleSmall
                  //   const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
            ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.movies.length,
                itemBuilder: (_, int index) => _MoviePoster(
                    widget.movies[index], widget.movies[index].id)),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  final int heroId;

  const _MoviePoster(this.movie, this.heroId);

  @override
  Widget build(BuildContext context) {
    movie.id = heroId;

    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => //context.push('/home/0/movie/${movie.id}'),
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.id.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: movie.backdropPath,
                  placeholder: (_, __) => Image.asset('assets/placeholder.jpg'),
                  errorWidget: (context, error, stackTrace) {
                    return Image.asset('assets/placeholder.jpg');
                  },
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
