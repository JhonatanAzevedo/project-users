import 'package:user_info/src/models/user_address_model.dart';

class UserModel {
  final String name;
  final String username;
  final String email;
  final String phone;
  final UserAddressModel address;

  UserModel({
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      address: UserAddressModel.fromJson(map['address'] as Map<String, dynamic>),
    );
  }
}
