import 'package:login_app/data/models/user.dart';

abstract class UserRepository {
  Future<void> authenticate(User user);
}