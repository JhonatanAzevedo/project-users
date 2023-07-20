import 'package:dio/dio.dart';

import '../models/user_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<UserModel>> fetchUsers() async {
    final response = await _dio.get('https://jsonplaceholder.typicode.com/users');
    final List<dynamic> responseData = response.data;
    return responseData.map((userJson) => UserModel.fromJson(userJson)).toList();
  }
}
