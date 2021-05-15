import 'package:bloc/bloc.dart';
import 'package:ft_hangout/data/model/user.dart';
import 'package:ft_hangout/data/repository.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final Repository repository;
  ProfileCubit({required this.repository}) : super(ProfileInitial());

  void fetchTodos(String username) {
    repository.fetchUser42(username).then((value) {
      if (value != null) {
        emit(ProfileLoaded(user: value));
      } else {
        emit(ProfileNotFound(error: "User not found"));
      }
    });
  }
}
