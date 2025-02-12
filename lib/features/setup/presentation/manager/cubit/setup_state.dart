part of 'setup_cubit.dart';

@immutable
sealed class SetupState {}

final class SetupInitial extends SetupState {}

final class SetupLoading extends SetupState {}

final class SetupCompleted extends SetupState {
  final User user;

  SetupCompleted(this.user);
}

final class SetupError extends SetupState {
  final String message;

  SetupError(this.message);
}
