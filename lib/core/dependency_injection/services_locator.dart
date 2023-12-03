import 'package:get_it/get_it.dart';
import 'package:tentwenty_apptest/features/search/data/datasource/search_remote_data_source.dart';
import 'package:tentwenty_apptest/features/search/data/repository/search_repository_impl.dart';
import 'package:tentwenty_apptest/features/search/domain/repository/search_repository.dart';
import 'package:tentwenty_apptest/features/search/domain/usecases/search_usecase.dart';
import 'package:tentwenty_apptest/features/search/presentation/controllers/search_bloc/search_bloc.dart';
import 'package:tentwenty_apptest/features/watch/data/datasource/movie_remote_data_source.dart';
import 'package:tentwenty_apptest/features/watch/data/repository/movies_repository.dart';
import 'package:tentwenty_apptest/features/watch/domain/repository/base_movies_repository.dart';
import 'package:tentwenty_apptest/features/watch/domain/usecases/get_movie_details_usecase.dart';
import 'package:tentwenty_apptest/features/watch/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:tentwenty_apptest/features/watch/domain/usecases/get_popular_movies_usecase.dart';
import 'package:tentwenty_apptest/features/watch/domain/usecases/get_recommendation_usecase.dart';
import 'package:tentwenty_apptest/features/watch/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/cubit/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movie_details_bloc.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movies_bloc.dart';


final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
    sl.registerLazySingleton<BottomNavCubit>(() => BottomNavCubit());
    sl.registerFactory(() => SearchBloc(sl()));



    /// Use Cases
    sl.registerLazySingleton(() => GetUpcomingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    sl.registerLazySingleton(() => SearchUseCase(sl()));


    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));
    sl.registerLazySingleton<SearchRepository>(
            () => SearchRepositoryImpl(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
    sl.registerLazySingleton<SearchRemoteDataSource>(
            () => SearchRemoteDataSourceImpl());
  }
}
