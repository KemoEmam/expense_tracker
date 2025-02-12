import 'package:expense_tracker/features/setup/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> saveUser(User user);
  Future<User?> getUser();
  Future<bool> isSetupCompleted();
  Future<void> clearUserData();
}
