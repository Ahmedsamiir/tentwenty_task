import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty_apptest/core/utils/enums.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/cubit/bottom_navigation_cubit/bottom_navigation_states.dart';

class BottomNavCubit extends Cubit<BottomNavStates> {
  BottomNavCubit() : super(const BottomNavStates(BottomNavItems.dashboard, 0));

  void getBottomNavItem(BottomNavItems bottomNavigationItems) {
    switch (bottomNavigationItems) {
      case BottomNavItems.dashboard:
        emit(const BottomNavStates(BottomNavItems.dashboard, 0));
        break;
      case BottomNavItems.watch:
        emit(const BottomNavStates(BottomNavItems.watch, 1));
        break;
      case BottomNavItems.media:
        emit(const BottomNavStates(BottomNavItems.media, 2));
        break;

      case BottomNavItems.more:
        emit(const BottomNavStates(BottomNavItems.more, 3));
        break;
      default:
        emit(const BottomNavStates(BottomNavItems.watch, 1));
    }
  }
}
