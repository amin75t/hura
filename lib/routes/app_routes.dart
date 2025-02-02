import 'package:get/get.dart';
import '../screens/user_list_screen.dart';
import '../screens/add_user_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => UserListScreen()),
    GetPage(name: '/addUser', page: () => AddUserScreen()),
  ];
}
