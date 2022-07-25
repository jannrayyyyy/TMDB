import 'package:flutter/material.dart';

import '../../../../core/constant/api_constant.dart';
import '../../../../domain/entities/movie_entity.dart';
import 'modalbuilder.dart';

class MovieDisplayResult extends StatelessWidget {
  final List<MovieEntity> movies;
  const MovieDisplayResult({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: movies.map((movie) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ModalBuilderWidget(
                            movie: movie,
                          );
                        });
                  },
                  child: Image.network(
                    '$BASE_IMAG_URL${movie.posterPath}',
                    height: 195,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
