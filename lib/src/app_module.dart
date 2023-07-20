import 'package:flutter_modular/flutter_modular.dart';

import 'repositories/user_repository.dart';
import 'services/api_service.dart';
import 'view_models/user_viewmodel.dart';
import 'views/user_information_page.dart';
import 'views/users_home_page.dart';
import 'views/widgets/error_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton(
          (i) => ApiService(),
        ),
        Bind.lazySingleton(
          (i) => UserRepository(
            i.get<ApiService>(),
          ),
        ),
        Bind.lazySingleton(
          (i) => UserViewModel(
            i.get<UserRepository>(),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (ctx, args) => UsersHomePage(),
        ),
        ChildRoute(
          '/user_information',
          child: (_, args) => UserInformationPage(user: args.data),
        ),
        ChildRoute(
          '/error',
          child: (_, args) => ErrorPage(tryAgain: args.data),
        ),
      ];
}
