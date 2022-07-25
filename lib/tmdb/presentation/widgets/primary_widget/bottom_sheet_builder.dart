import 'package:flutter/material.dart';

import '../../../core/constant/api_constant.dart';
import '../../../domain/entities/movie_entity.dart';

class BottomSheetBuilder extends StatefulWidget {
  final MovieEntity movie;
  const BottomSheetBuilder({Key? key, required this.movie}) : super(key: key);

  @override
  State<BottomSheetBuilder> createState() => _BottomSheetBuilderState();
}

class _BottomSheetBuilderState extends State<BottomSheetBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    NetworkImage('$BASE_IMAG_URL${widget.movie.backdropPath}'),
                opacity: 0.7,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      )),
    );
  }
}
