import 'package:login_app/data/models/user.dart';
import 'package:login_app/data/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<void> authenticate(User user) async {
    await Future.delayed(const Duration(seconds: 1));
    print("Credenciais de autenticação user: ${user.username}, senha: ${user.password}");
  }

}