import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dependency_injection.dart';
import '../cubit/home_cubit/home_cubit.dart';
import '../widgets/components/screen_component/nowplaying_display.dart';
import '../widgets/components/screen_component/popular_display.dart';
import '../widgets/components/screen_component/trending_display.dart';
import '../widgets/components/screen_component/upcoming_display.dart';
import '../widgets/primary_widget/genre_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => sl<HomeCubit>(),
      child: SingleChildScrollView(
        child: Column(children: const [
          PopularDisplayWidget(movie: []),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 20),
            child: GenreWidget(),
          ),
          NowplayingDisplayWidget(),
          SizedBox(height: 20),
          TrendingDisplayWidget(),
          SizedBox(height: 20),
          UpcomingDisplayWidget(),
          SizedBox(height: 100)
        ]),
      ),
    );
  }
}
