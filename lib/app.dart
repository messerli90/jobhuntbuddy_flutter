import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/data/repositories/user_repository.dart';
import 'features/auth/presentation/bloc/auth/bloc.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'features/lead/presentation/pages/leads_screen.dart';
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
              return HomeScreen();
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

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedBottomNavIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavList =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.label),
      title: Text('Leads'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.label),
      title: Text('Profile'),
    ),
  ];

  Widget getBody() {
    switch (_selectedBottomNavIndex) {
      case 0:
        return LeadsListPage();
        break;
      case 1:
        return Center(
          child: Text('not lists'),
        );
        break;
      default:
        return LeadsListPage();
    }
  }

  void _onBottomNavTapped(int index) {
    debugPrint('setting index to: $index');
    setState(() {
      _selectedBottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JobHuntBuddy'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(LoggedOut());
            },
          )
        ],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return getBody();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottomNavIndex,
        onTap: _onBottomNavTapped,
        items: _bottomNavList,
      ),
    );
  }
}
