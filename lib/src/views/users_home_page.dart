import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';
import '../view_models/user_state.dart';
import '../view_models/user_viewmodel.dart';
import 'widgets/loading_shimmer.dart';

class UsersHomePage extends StatefulWidget {
  const UsersHomePage({super.key});

  @override
  State<UsersHomePage> createState() => _UsersHomePageState();
}

class _UsersHomePageState extends ViewState<UsersHomePage, UserViewModel> {
  @override
  Widget build(BuildContext context) {
    return ViewModelConsumer<UserViewModel, UserState>(
        viewModel: viewModel,
        listener: (context, state) {
          if (state.error) {
            Modular.to.pushNamed(
              '/error',
              arguments: () {
                Modular.to.pop();
                viewModel.showUsers();
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              titleSpacing: 24.0,
              title: const Text('Usuários'),
            ),
            body: !state.loading
                ? ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
                    separatorBuilder: (context, index) => const SizedBox(height: 20.0),
                    itemCount: state.users.length,
                    itemBuilder: (BuildContext context, int index) {
                      final user = state.users[index];
                      return InkWell(
                        onTap: () => Modular.to.pushNamed('/user_information', arguments: user),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/user.png'),
                                  backgroundColor: Colors.transparent,
                                ),
                                const SizedBox(width: 16.0),
                                Text(user.name),
                                const Spacer(),
                                const Icon(
                                  Icons.more_horiz,
                                  size: 40.0,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              height: 3.0,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const LoadingShimmer(),
          );
        });
  }
}
