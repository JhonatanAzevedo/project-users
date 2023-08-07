import 'package:user_info/src/view_models/user_state.dart';

import '../../core/core.dart';
import '../repositories/user_repository.dart';

class UserViewModel extends ViewModel<UserState> {
  final UserRepository _userRepository;

  UserViewModel(this._userRepository) : super(UserState.initial());

  @override
  void initViewModel() {
    super.initViewModel();
    showUsers();
  }

  Future<void> showUsers() async {
    emit(state.copyWith(loading: true));
    final response = await _userRepository.fetchUsers();

    var newState = response.fold(
      (error) => state.copyWith(error: true),
      (users) => state.copyWith(users: users),
    );

    emit(newState.copyWith(loading: false));
  }
}
