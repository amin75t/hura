import 'package:dio/dio.dart';
import '../models/user.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api/'));

  // Fetch users
  Future<List<User>> fetchUsers(int page) async {
    try {
      final response = await _dio.get('users', queryParameters: {'page': page});
      if (response.statusCode == 200) {
        List users = response.data['data'];
        return users.map((user) => User.fromJson(user)).toList();
      } else {
        return Future.error('Failed to load users (Server error)');
      }
    } on DioException catch (e) {
      // Handle Dio specific errors
      if (e.type == DioExceptionType.connectionError) {
        return Future.error('Connection timeout. Please try again.');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return Future.error(
            'The server took too long to respond. Please try again.');
      } else if (e.type == DioExceptionType.badResponse) {
        return Future.error('Server error: ${e.response?.statusCode}');
      } else {
        return Future.error('Network error. Please check your connection.');
      }
    } catch (e) {
      // Catch all other errors
      return Future.error('Unexpected error occurred: $e');
    }
  }

  // Add a new user
  Future<void> addUser(String firstName, String lastName) async {
    try {
      final response = await _dio.post(
        'users',
        data: {'first_name': firstName, 'last_name': lastName},
      );
      if (response.statusCode != 201) {
        return Future.error('Failed to add user');
      }
    } on DioException catch (e) {
      // Handle errors when adding the user
      if (e.type == DioExceptionType.connectionTimeout) {
        return Future.error('Connection timeout. Please try again.');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return Future.error(
            'The server took too long to respond. Please try again.');
      } else if (e.type == DioExceptionType.badResponse) {
        return Future.error('Server error: ${e.response?.statusCode}');
      } else {
        return Future.error('Network error. Please check your connection.');
      }
    } catch (e) {
      return Future.error('Unexpected error occurred: $e');
    }
  }
}
