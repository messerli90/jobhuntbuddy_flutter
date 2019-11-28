import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhuntbuddy/features/lead/presentation/bloc/bloc.dart';
import 'package:jobhuntbuddy/features/lead/presentation/bloc/lead_bloc.dart';
import 'package:jobhuntbuddy/injection_container.dart';

import 'features/auth/data/repositories/user_repository.dart';
import 'features/auth/presentation/bloc/auth/bloc.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'view/pages/home_screen.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) {
            return _authBloc..add(AppStarted());
          },
        ),
        BlocProvider<LeadBloc>(
          create: (context) {
            return sl<LeadBloc>()..add(LoadLeads());
          },
        )
      ],
      child: MaterialApp(
        title: 'JobHuntBuddy',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) {
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is Unauthenticated) {
                  return LoginScreen(userRepository: _userRepository);
                }
                if (state is Authenticated) {
                  return HomeScreen();
                }
                return SplashScreen();
              },
            );
          }
        },
      ),
    );
    // return BlocProvider<AuthBloc>(
    //   builder: (BuildContext context) => _authBloc,
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData.dark(),
    //     home: BlocBuilder(
    //       bloc: _authBloc,
    //       builder: (BuildContext context, AuthState state) {
    //         if (state is Uninitialized) {
    //           return SplashScreen();
    //         }
    //         if (state is Unauthenticated) {
    //           return LoginScreen(userRepository: _userRepository);
    //         }
    //         if (state is Authenticated) {
    //           return HomeScreen(user: state.user);
    //         }
    //         return Container();
    //       },
    //     ),
    //   ),
    // );
  }
}
