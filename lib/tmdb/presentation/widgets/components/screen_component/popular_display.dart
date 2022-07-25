import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/api_constant.dart';
import '../../../../domain/entities/movie_entity.dart';
import '../../../cubit/popular_cubit/popular_cubit.dart';
import '../important/modalbuilder.dart';

class PopularDisplayWidget extends StatefulWidget {
  final List<MovieEntity> movie;
  const PopularDisplayWidget({Key? key, required this.movie}) : super(key: key);

  @override
  State<PopularDisplayWidget> createState() => _PopularDisplayWidgetState();
}

class _PopularDisplayWidgetState extends State<PopularDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularState>(builder: (content, state) {
      if (state is PopularLoaded) {
        return Container(
          color: Colors.red,
          child: CarouselSlider(
            items: state.movies.map((e) {
              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (buildContext) {
                        return ModalBuilderWidget(
                          movie: e,
                        );
                      });
                },
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: NetworkImage(
                            '$BASE_IMAG_URL${e.backdropPath}',
                          ),
                          fit: BoxFit.cover,
                          opacity: 0.8)),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(100, 50, 100, 50),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white)),
                    child: Image.network(
                      '$BASE_IMAG_URL${e.posterPath}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
                height: 400,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayCurve: Curves.ease),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
