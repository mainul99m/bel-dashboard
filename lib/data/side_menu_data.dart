import 'package:bel_dashboard/models/menu_model.dart';

class SideMenuData{
  final menu = <MenuModel>[
    MenuModel(icon: "assets/icons/home.svg", title: 'Dashboard'),
    MenuModel(icon: "assets/icons/shark.svg", title: 'Shark'),
    MenuModel(icon: "assets/icons/ray.svg", title: 'Ray'),
    MenuModel(icon: "assets/icons/guitar.svg", title: 'Guitar'),
    MenuModel(icon: "assets/icons/users.svg", title: 'Profile'),
    MenuModel(icon: "assets/icons/logout.svg", title: 'Logout'),
  ];
}