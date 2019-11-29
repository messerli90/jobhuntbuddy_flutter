import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/data/repositories/user_repository.dart';
import 'features/auth/presentation/bloc/auth/bloc.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'features/lead/domain/repositories/lead_repository.dart';
import 'features/lead/presentation/bloc/bloc.dart';
import 'features/lead/presentation/bloc/lead_bloc.dart';
import 'injection_container.dart';
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

  ThemeData _themeData = ThemeData(
    primarySwatch: Colors.blueGrey,

    // backgroundColor: Color(Colors.grey[200].value),
    // bottomAppBarColor: Color(Colors.grey[400].value),
    // appBarTheme: AppBarTheme(
    //   color: Color(Colors.grey[400].value)
    // )
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) {
            return _authBloc..add(AppStarted());
          },
        ),
      ],
      child: MaterialApp(
        title: 'JobHuntBuddy',
        debugShowCheckedModeBanner: false,
        theme: _themeData,
        routes: {
          '/': (context) {
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is Unauthenticated) {
                  return LoginScreen(userRepository: _userRepository);
                }
                if (state is Authenticated) {
                  return BlocProvider<LeadBloc>(
                    create: (context) {
                      return LeadBloc(
                          userId: state.user.uid,
                          repository: sl<LeadRepository>())
                        ..add(LoadLeads());
                    },
                    child: HomeScreen(),
                  );
                  // return HomeScreen();
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
