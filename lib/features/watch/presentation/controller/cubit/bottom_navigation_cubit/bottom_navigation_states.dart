
import 'package:equatable/equatable.dart';
import 'package:tentwenty_apptest/core/utils/enums.dart';

class BottomNavStates extends Equatable {
  final BottomNavItems navbarItem;
  final int index;

  const BottomNavStates(this.navbarItem, this.index);

  @override
  List<Object> get props => [navbarItem, index];
}