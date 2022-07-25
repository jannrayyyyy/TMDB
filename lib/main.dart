import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependency_injection.dart';
import 'dependency_injection.dart' as di;
import 'tmdb/presentation/cubit/cast_cubit/cast_cubit.dart';
import 'tmdb/presentation/cubit/home_cubit/home_cubit.dart';
import 'tmdb/presentation/cubit/movie_detail_cubit/movie_detail_cubit.dart';
import 'tmdb/presentation/cubit/now_playing_cubit/now_playing_cubit.dart';
import 'tmdb/presentation/cubit/popular_cubit/popular_cubit.dart';
import 'tmdb/presentation/cubit/search_cubit/search_cubit.dart';
import 'tmdb/presentation/cubit/trending_cubit/trending_cubit.dart';
import 'tmdb/presentation/cubit/up_coming_cubit/up_coming_cubit.dart';
import 'tmdb/presentation/cubit/video_cubit/video_cubit.dart';
import 'tmdb/presentation/pages/mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CastCubit>(
            create: (context) => sl<CastCubit>(),
          ),
          BlocProvider<HomeCubit>(
            create: (context) => sl<HomeCubit>(),
          ),
          BlocProvider<MovieDetailCubit>(
            create: (context) => sl<MovieDetailCubit>(),
          ),
          BlocProvider<NowPlayingCubit>(
            create: (context) => sl<NowPlayingCubit>()..nowPlaying(),
          ),
          BlocProvider<PopularCubit>(
            create: (context) => sl<PopularCubit>()..getPopular(),
          ),
          BlocProvider<SearchCubit>(
            create: (context) => sl<SearchCubit>(),
          ),
          BlocProvider<TrendingCubit>(
            create: (context) => sl<TrendingCubit>()..getTrending(),
          ),
          BlocProvider<UpComingCubit>(
            create: (context) => sl<UpComingCubit>()..getUpComing(),
          ),
          BlocProvider<VideoCubit>(
            create: (context) => sl<VideoCubit>(),
          ),
        ],
        child: const MainPage(),
      ),
    );
  }
}
