import 'package:expense_tracker/core/services/shared_prefs.dart';
import 'package:expense_tracker/features/setup/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/setup/domain/repos/user_repo.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  @override
  Future<void> saveUser(User user) async {
    await Prefs.saveString('user_name', user.name);
    await Prefs.saveDouble('initial_balance', user.initialBalance);
  }

  @override
  Future<User?> getUser() async {
    final name = await Prefs.getString('user_name');
    final balance = await Prefs.getDouble('initial_balance');
    if (name == null || balance == null) return null;
    return User(name: name, initialBalance: balance);
  }

  @override
  Future<bool> isSetupCompleted() async {
    return (await Prefs.containsKey('user_name')) &&
        (await Prefs.containsKey('initial_balance'));
  }

  @override
  Future<void> clearUserData() async {
    await Prefs.removeData('user_name');
    await Prefs.removeData('initial_balance');
  }
}
