import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import 'add_user_screen.dart';
import '../widgets/card_user.dart';

class UserListScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    userController.fetchUsers();

    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: Obx(() {
        if (userController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Show error message if there's any
        if (userController.errorMessage.value.isNotEmpty) {
          return Center(
            child: Text(
              'Error: ${userController.errorMessage.value}',
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        // Show the user list if everything is fine
        return ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            final user = userController.users[index];
            return ListTile(
              title: UserCard(
                firstName: user.firstName,
                lastName: user.lastName,
                email: user.email,
                avatar: user.avatar,
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddUserScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
