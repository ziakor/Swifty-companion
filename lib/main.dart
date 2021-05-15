import 'package:flutter/material.dart';
import 'package:ft_hangout/src/router.dart';

void main() {
  runApp(App(
    router: AppRouter(),
  ));
}

class App extends StatelessWidget {
  final AppRouter router;

  const App({Key? key, required this.router}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swifty companion',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
