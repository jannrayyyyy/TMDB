import '../../../core/theme/themedata.dart';
import '../../../core/utils/genre_filter.dart';
import '../../cubit/genre_cubit/genre_cubit.dart';
import 'custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection.dart';
import '../../pages/genrepage.dart';

class GenreWidget extends StatefulWidget {
  const GenreWidget({Key? key}) : super(key: key);

  @override
  State<GenreWidget> createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      constraints: const BoxConstraints(maxHeight: 350),
      color: textBg1,
      onSelected: (int id) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider<GenreCubit>(
                      create: (context) =>
                          sl<GenreCubit>()..chooseGenre(id: id),
                      child: GenrePage(id: id),
                    )));
      },
      itemBuilder: (context) {
        return genreList
            .map(
              (genre) => PopupMenuItem(
                value: genre.id,
                textStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                child: InkWell(
                  child: CustomTextWidget(
                    text: genre.name!,
                  ),
                ),
              ),
            )
            .toList();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomTextWidget(
              text: 'Genres',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            Icon(Icons.arrow_drop_down_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
