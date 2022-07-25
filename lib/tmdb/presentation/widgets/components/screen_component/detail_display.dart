import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/api_constant.dart';
import '../../../../domain/entities/movie_entity.dart';
import '../../../cubit/movie_detail_cubit/movie_detail_cubit.dart';

class DetailDisplayWidget extends StatelessWidget {
  final int id;
  final MovieEntity movie;
  const DetailDisplayWidget({Key? key, required this.id, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoaded) {
            return SingleChildScrollView(
              child: Column(children: [
                Image.network('$BASE_IMAG_URL${state.movieDetail.posterPath}')
              ]),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
