import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  UserViewModel(this._userRepository);

  List<UserModel>? _users;
  bool _loading = false;
  bool _error = false;

  bool get loading => _loading;
  bool get error => _error;
  List<UserModel>? get users => _users;

  void setLoading(bool isLoading) {
    _loading = isLoading;
    notifyListeners();
  }

  Future<void> showUsers() async {
    _loading = true;
    _error = false;
    final response = await _userRepository.fetchUsers();

    response.fold(
      (error) => _error = true,
      (success) => _users = success,
    );
    
    _loading = false;
    notifyListeners();
  }
}
