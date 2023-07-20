import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'widgets/user_tile.dart';

class UserInformationPage extends StatelessWidget {
  const UserInformationPage({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Informações'),
      ),
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/user.png'),
              backgroundColor: Colors.transparent,
            ),
            Text(
              user.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              user.username,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 10.0),
            const Divider(
              color: Colors.grey,
              height: 3.0,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  UserTile(
                    typeInformation: 'Cidade',
                    label: user.address.city,
                    icon: Icons.location_city_outlined,
                  ),
                  const SizedBox(height: 10.0),
                  UserTile(
                    typeInformation: 'Rua',
                    label: user.address.street,
                    icon: Icons.streetview_outlined,
                  ),
                  const SizedBox(height: 10.0),
                  UserTile(
                    typeInformation: 'Apartamento',
                    label: user.address.suite,
                    icon: Icons.apartment_outlined,
                  ),
                  const SizedBox(height: 10.0),
                  UserTile(
                    typeInformation: 'CEP',
                    label: user.address.zipcode,
                    icon: Icons.location_on,
                  ),
                  const SizedBox(height: 10.0),
                  UserTile(
                    typeInformation: 'Email',
                    label: user.email,
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 10.0),
                  UserTile(
                    typeInformation: 'Telefone',
                    label: user.phone,
                    icon: Icons.phone,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
