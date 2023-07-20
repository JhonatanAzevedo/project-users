class UserAddressModel {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  UserAddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  factory UserAddressModel.fromJson(Map<String, dynamic> map) {
    return UserAddressModel(
      street: map['street'] as String,
      suite: map['suite'] as String,
      city: map['city'] as String,
      zipcode: map['zipcode'] as String,
    );
  }
}
