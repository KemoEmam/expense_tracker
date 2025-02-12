import 'package:bloc/bloc.dart';
import 'package:expense_tracker/features/setup/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/setup/domain/repos/user_repo.dart';
import 'package:meta/meta.dart';

part 'setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  final UserRepository _userRepository;

  SetupCubit(this._userRepository) : super(SetupInitial());

  Future<void> saveUserData(String name, double initialBalance) async {
    emit(SetupLoading());
    try {
      final user = User(name: name, initialBalance: initialBalance);
      await _userRepository.saveUser(user);
      emit(SetupCompleted(user));
    } catch (e) {
      emit(SetupError(e.toString()));
    }
  }

  Future<void> clearUserData() async {
    emit(SetupLoading());
    try {
      await _userRepository.clearUserData();
      emit(SetupInitial());
    } catch (e) {
      emit(SetupError(e.toString()));
    }
  }
}
