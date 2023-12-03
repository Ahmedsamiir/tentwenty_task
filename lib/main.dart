import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tentwenty_apptest/core/config/app_routes.dart';
import 'package:tentwenty_apptest/core/dependency_injection/services_locator.dart';
import 'package:tentwenty_apptest/core/utils/app_strings.dart';
import 'package:tentwenty_apptest/core/utils/theme/theme.dart';
import 'package:tentwenty_apptest/features/booking/presentation/screens/booking_screen.dart';
import 'package:tentwenty_apptest/features/search/presentation/screens/search_screen.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/cubit/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/bottom_nav_bar_screen.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/inactive_screens/dashboard_screen.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/movie_details_screen.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/movie_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Change status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white,
          /* set Status bar color in Android devices. */

          statusBarIconBrightness: Brightness.dark,
          /* set Status bar icons color in Android devices.*/

          statusBarBrightness: Brightness.dark) /* set Status bar icon color in iOS. */
      );

  ServicesLocator().init();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      //darkTheme: TAppTheme.darkTheme,
      //home:  BookingScreen(),
      onGenerateRoute: AppRoutes.onGenerateRoute,

    );
  }
}
