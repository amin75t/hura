import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class AddUserScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            SizedBox(height: 20),
            Obx(() {
              return userController.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        final firstName = firstNameController.text;
                        final lastName = lastNameController.text;
                        if (firstName.isNotEmpty && lastName.isNotEmpty) {
                          userController.addUser(firstName, lastName);
                          Get.back(); // Go back after adding the user
                        } else {
                          Get.snackbar('Error',
                              'Please enter both first and last names');
                        }
                      },
                      child: Text('Add User'),
                    );
            }),
            // Show error message for adding user if exists
            Obx(() {
              if (userController.errorMessage.value.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Error: ${userController.errorMessage.value}',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              return SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
