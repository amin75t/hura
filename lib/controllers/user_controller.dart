import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';
import '../models/user.dart';

class UserController extends GetxController {
  final ApiService apiService = ApiService();

  var users = <User>[];
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Fetch users from the API
  void fetchUsers() async {
    try {
      isLoading(true);
      errorMessage('');
      List<User> fetchedUsers = await apiService.fetchUsers(1);
      users.clear();
      users.addAll(fetchedUsers);
    } catch (e) {
      // Handle errors
      errorMessage(e.toString());
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }

  // Add a new user
  void addUser(String firstName, String lastName) async {
    try {
      isLoading(true);
      errorMessage('');
      await apiService.addUser(firstName, lastName);
      fetchUsers(); // Refresh the list after adding a new user
    } catch (e) {
      // Handle errors
      errorMessage(e.toString());
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }
}
