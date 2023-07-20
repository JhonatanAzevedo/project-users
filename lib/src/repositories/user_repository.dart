import 'package:dartz/dartz.dart';

import '../models/user_model.dart';
import '../services/api_service.dart';

class UserRepository {
  final ApiService _apiService;

  UserRepository(this._apiService);
  Future<Either<Exception, List<UserModel>>> fetchUsers() async {
    try {
      final response = await _apiService.fetchUsers();
      return Right(response);
    } catch (e) {
      return Left(Exception());
    }
  }
}
