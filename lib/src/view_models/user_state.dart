import '../../core/core.dart';
import '../models/user_model.dart';

class UserState extends ViewModelState {
  factory UserState.initial() => const UserState();

  const UserState({this.users = const [], this.loading = false, this.error = false});
  final List<UserModel> users;
  final bool loading;
  final bool error;

  UserState copyWith({
    List<UserModel>? users,
    bool? loading,
    bool? error,
  }) {
    return UserState(
      users: users ?? this.users,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }
}
