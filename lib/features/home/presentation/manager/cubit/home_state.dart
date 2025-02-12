part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<Expense> expenses;
  final User user;

  HomeLoaded(this.expenses, this.user);
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
