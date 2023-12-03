import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty_apptest/core/dependency_injection/services_locator.dart';
import 'package:tentwenty_apptest/features/search/presentation/controllers/search_bloc/search_bloc.dart';
import 'package:tentwenty_apptest/features/search/presentation/screens/search_screen.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/cubit/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/bottom_nav_bar_screen.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/inactive_screens/dashboard_screen.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/inactive_screens/media_library.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/inactive_screens/more_screen.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/movie_details_screen.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/movie_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String watchScreen = '/watchScreen';
  static const String watchDetailsScreen = '/watchDetailsScreen';
  static const String searchScreen = '/searchScreen';
  static const String moreScreen = '/moreScreen';
  static const String dashBoardScreen = '/dashBoardScreen';
  static const String mediaLibraryScreen = '/mediaLibraryScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    final int id;

    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) {
          return MultiBlocProvider(providers: [
            BlocProvider<BottomNavCubit>(
              create: ((context) => sl<BottomNavCubit>()),
            ),
            BlocProvider<SearchBloc>(
              create: ((context) => sl<SearchBloc>()),
            ),
          ], child: const BottomNavigationBarScreen());
        }));
      case Routes.watchScreen:
        return MaterialPageRoute(builder: ((context) {
          return const WatchScreen();
        }));
      case Routes.dashBoardScreen:
        return MaterialPageRoute(builder: ((context) {
          return const DashboardScreen();
        }));
      case Routes.watchDetailsScreen:
        return MaterialPageRoute(builder: (context) => const MovieDetailsScreen(), settings: RouteSettings(arguments: args));
        case Routes.searchScreen:
        return MaterialPageRoute(builder: (context) => const SearchScreen(), settings: RouteSettings(arguments: args));
      case Routes.moreScreen:
        return MaterialPageRoute(
          builder: (context) => const MoreScreen(),
        );

      case Routes.mediaLibraryScreen:
        return MaterialPageRoute(
          builder: (context) => const MediaLibraryScreen(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text('Not Defined'),
              ),
            )));
  }
}
