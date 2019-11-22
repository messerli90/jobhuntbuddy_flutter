import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/data/repositories/user_repository.dart';
import 'features/auth/presentation/bloc/auth/bloc.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'features/lead/presentation/pages/leads_list.dart';
import 'view/pages/splash_screen.dart';

class App extends StatefulWidget {
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final UserRepository _userRepository = UserRepository();
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(userRepository: _userRepository);
    _authBloc.add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      builder: (BuildContext context) => _authBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: BlocBuilder(
          bloc: _authBloc,
          builder: (BuildContext context, AuthState state) {
            if (state is Uninitialized) {
              return SplashScreen();
            }
            if (state is Unauthenticated) {
              return LoginScreen(userRepository: _userRepository);
            }
            if (state is Authenticated) {
              return LeadsListPage();
            }
            return Container();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }
}
