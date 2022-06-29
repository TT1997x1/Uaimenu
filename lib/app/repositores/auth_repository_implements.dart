import 'package:application_uaimenu/app/moldes/user_moldes.dart';

abstract class AuthRepository {
  Future<UserModel> login(String name, String password);
  Future<UserModel> register(String name, String email, String password);
}
