import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ft_hangout/cubit/profile_cubit.dart';
import 'package:ft_hangout/data/model/user.dart';
import 'package:ft_hangout/data/oauth_service.dart';
import 'package:ft_hangout/data/repository.dart';
import 'package:ft_hangout/src/ui/HomePage.dart';
import 'package:ft_hangout/src/ui/profile_page.dart';

class AppRouter {
  late Repository repository;
  late ProfileCubit profileCubit;

  AppRouter() {
    repository = Repository(oauthService: OauthService());
    profileCubit = ProfileCubit(repository: repository);
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: profileCubit,
            child: HomePage(),
          ),
        );
      case "/profile":
        final user = settings.arguments! as User;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: profileCubit,
            child: ProfilePage(
              user: user,
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: profileCubit,
            child: HomePage(),
          ),
        );
    }
  }
}
