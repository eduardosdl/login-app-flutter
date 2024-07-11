// lib/presentation/screens/login/login_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:login_app/data/models/user.dart';
import 'package:login_app/data/repositories/user_repository.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepository userRepository;

  LoginCubit(this.userRepository) : super(LoginInitial());

  void login(String username, String password) async {
    emit(LoginLoading());
    try {
      User user = User(username: username, password: password);
      await userRepository.authenticate(user);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure('Login failed'));
    }
  }
}
