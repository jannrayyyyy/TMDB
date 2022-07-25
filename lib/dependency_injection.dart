
import 'package:get_it/get_it.dart';

import 'tmdb/data/datasource/remote_datasource.dart';
import 'tmdb/data/repositories/movie_repository_impl.dart';
import 'tmdb/domain/repositories/movie_repository.dart';
import 'tmdb/domain/usecases/get_cast.dart';
import 'tmdb/domain/usecases/get_genra.dart';
import 'tmdb/domain/usecases/get_movie.dart';
import 'tmdb/domain/usecases/get_popular.dart';
import 'tmdb/domain/usecases/get_trending.dart';
import 'tmdb/domain/usecases/get_up_coming.dart';
import 'tmdb/domain/usecases/get_video.dart';
import 'tmdb/domain/usecases/now_playing.dart';
import 'tmdb/domain/usecases/search_movie.dart';
import 'tmdb/domain/usecases/select_genre.dart';
import 'tmdb/presentation/cubit/cast_cubit/cast_cubit.dart';
import 'tmdb/presentation/cubit/genre_cubit/genre_cubit.dart';
import 'tmdb/presentation/cubit/home_cubit/home_cubit.dart';
import 'tmdb/presentation/cubit/movie_detail_cubit/movie_detail_cubit.dart';
import 'tmdb/presentation/cubit/now_playing_cubit/now_playing_cubit.dart';
import 'tmdb/presentation/cubit/popular_cubit/popular_cubit.dart';
import 'tmdb/presentation/cubit/search_cubit/search_cubit.dart';
import 'tmdb/presentation/cubit/trending_cubit/trending_cubit.dart';
import 'tmdb/presentation/cubit/up_coming_cubit/up_coming_cubit.dart';
import 'tmdb/presentation/cubit/video_cubit/video_cubit.dart';

final sl = GetIt.instance;

Future init() async {
  //** Cubit */
  sl.registerFactory(() => CastCubit(sl()));
  sl.registerFactory(() => GenreCubit(sl()));
  sl.registerFactory(() => HomeCubit());
  sl.registerFactory(
      () => MovieDetailCubit(getMovieDetails: sl(), video: sl()));
  sl.registerFactory(() => NowPlayingCubit(sl()));
  sl.registerFactory(() => PopularCubit(sl()));
  sl.registerFactory(() => SearchCubit(sl()));
  sl.registerFactory(() => TrendingCubit(sl()));
  sl.registerFactory(() => UpComingCubit(sl()));
  sl.registerFactory(() => VideoCubit(sl()));

  //** UseCases */

  sl.registerLazySingleton(() => GetCast(repo: sl()));
  sl.registerLazySingleton(() => GetVideo(repo: sl()));
  sl.registerLazySingleton(() => NowPlaying(repo: sl()));
  sl.registerLazySingleton(() => GetPopular(repo: sl()));
  sl.registerLazySingleton(() => GetTrending(repo: sl()));
  sl.registerLazySingleton(() => GetUpComing(repo: sl()));
  sl.registerLazySingleton(() => GetMovieDetail(repo: sl()));
  sl.registerLazySingleton(() => SearchMovie(repo: sl()));
  sl.registerLazySingleton(() => GetGenres(repo: sl()));
  sl.registerLazySingleton(() => ChooseGenre(repo: sl()));

  //** repo */
  sl.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remote: sl()));

  //** DataSource */
  sl.registerLazySingleton<RemoteDataSource>(() => RemotedataSourceImpl());
}
