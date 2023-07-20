import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../view_models/user_viewmodel.dart';
import 'widgets/loading_shimmer.dart';

class UsersHomePage extends StatefulWidget {
  UsersHomePage({super.key});
  final UserViewModel controller = Modular.get<UserViewModel>();

  @override
  State<UsersHomePage> createState() => _UsersHomePageState();
}

class _UsersHomePageState extends State<UsersHomePage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await widget.controller.showUsers();
    if (widget.controller.error) {
      Modular.to.pushNamed(
        '/error',
        arguments: () {
          Modular.to.pop();
          widget.controller.setLoading(true);
          init();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 24.0,
        title: const Text('Usuários'),
      ),
      body: AnimatedBuilder(
        animation: widget.controller,
        builder: (_, __) {
          return !widget.controller.loading
              ? ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
                  separatorBuilder: (context, index) => const SizedBox(height: 20.0),
                  itemCount: widget.controller.users?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final user = widget.controller.users?[index];
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
                              Text(user?.name ?? ''),
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
              : const LoadingShimmer();
        },
      ),
    );
  }
}


