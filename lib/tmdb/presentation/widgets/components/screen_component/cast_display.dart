import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/api_constant.dart';
import '../../../cubit/cast_cubit/cast_cubit.dart';
import '../../primary_widget/custom_text_widget.dart';

class CastDisplayWidget extends StatefulWidget {
  final int id;
  const CastDisplayWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<CastDisplayWidget> createState() => _CastDisplayWidgetState();
}

class _CastDisplayWidgetState extends State<CastDisplayWidget> {
  @override
  void initState() {
    context.read<CastCubit>().getCast(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        if (state is CastLoaded) {
          final cast = state.cast;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: cast.map((cast) {
              return Center(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextWidget(
                          text: cast.name,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            cast.posterPath.isNotEmpty
                                ? '$BASE_IMAG_URL${cast.posterPath}'
                                : NO_IMAGE_LINK,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList()),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
