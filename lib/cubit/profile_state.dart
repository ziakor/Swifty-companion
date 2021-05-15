part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User user;

  ProfileLoaded({required this.user});
}

class ProfileNotFound extends ProfileState {
  final String error;

  ProfileNotFound({required this.error});
}
