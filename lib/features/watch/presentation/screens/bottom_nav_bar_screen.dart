import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty_apptest/core/constants/image_strings.dart';
import 'package:tentwenty_apptest/core/utils/enums.dart';
import 'package:tentwenty_apptest/features/watch/presentation/components/widgets/bottom_nav_items_builder.dart';

import 'package:tentwenty_apptest/features/watch/presentation/controller/cubit/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/cubit/bottom_navigation_cubit/bottom_navigation_states.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/inactive_screens/dashboard_screen.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/inactive_screens/media_library.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/inactive_screens/more_screen.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/movie_screen.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNavStates>(

        builder: (context, state) => BottomNavigationBar(
          currentIndex: state.index,
          onTap: (index) => onTap(context, index: index),
          showUnselectedLabels: true,
          items: [
            bottomNavigationBarItemBuilder(iconPath: AppImage.tDashboardImage, label: BottomNavItems.dashboard.name),
            bottomNavigationBarItemBuilder(iconPath: AppImage.tActiveWatchImage, label: BottomNavItems.watch.name),
            bottomNavigationBarItemBuilder(iconPath: AppImage.tMediaImage, label: BottomNavItems.media.name),
            bottomNavigationBarItemBuilder(iconPath: AppImage.tMoreImage, label: BottomNavItems.more.name),
          ],
        ),
      ),
      body: BlocBuilder<BottomNavCubit, BottomNavStates>(builder: (context, state) {
        if (state.navbarItem == BottomNavItems.dashboard) {
          return const DashboardScreen();
        } else if (state.navbarItem == BottomNavItems.watch) {
          return const WatchScreen();
        } else if (state.navbarItem == BottomNavItems.more) {
          return const MoreScreen();
        } else if (state.navbarItem == BottomNavItems.media) {
          // return BlocProvider<MediaCenterCubit>(
          //   create: (context) => MediaCenterCubit(getMediaCenterDataUseCase: sl<GetMediaCenterDataUseCase>())..getMediaCenterData(),
          //   child: const MediaCenterScreen(),
          // );
          return const MediaLibraryScreen();

        }
        return  Container();
      }),
    );
  }

  onTap(context, {required int index}) {
    if (index == 0) {
      BlocProvider.of<BottomNavCubit>(context).getBottomNavItem(BottomNavItems.dashboard);
    } else if (index == 1) {
      BlocProvider.of<BottomNavCubit>(context).getBottomNavItem(BottomNavItems.watch);
    } else if (index == 2) {
      BlocProvider.of<BottomNavCubit>(context).getBottomNavItem(BottomNavItems.media);
    } else if (index == 3) {
      BlocProvider.of<BottomNavCubit>(context).getBottomNavItem(BottomNavItems.more);
    }
  }
}
