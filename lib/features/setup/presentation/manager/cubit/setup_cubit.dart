import 'package:bloc/bloc.dart';
import 'package:expense_tracker/features/setup/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/setup/domain/repos/user_repo.dart';
import 'package:meta/meta.dart';

part 'setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  final UserRepository _userRepository;

  SetupCubit(this._userRepository) : super(SetupInitial());

  Future<void> saveUserData(String name, double initialBalance) async {
    try {
      await _userRepository
          .saveUser(User(name: name, initialBalance: initialBalance));
      emit(SetupCompleted(User(name: name, initialBalance: initialBalance)));
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
