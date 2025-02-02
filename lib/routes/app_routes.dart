import 'package:get/get.dart';
import '../features/user/ui/add_user_screen.dart';
import '../features/user/ui/user_list_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => UserListScreen()),
    GetPage(name: '/addUser', page: () => AddUserScreen()),
  ];
}
