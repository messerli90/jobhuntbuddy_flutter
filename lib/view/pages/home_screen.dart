import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhuntbuddy/features/auth/presentation/pages/profile_screen.dart';

import '../../features/auth/presentation/bloc/auth/bloc.dart';
import '../../features/lead/presentation/pages/leads_screen.dart';

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
        return LeadsScreen();
        break;
      case 1:
        return ProfileScreen();
        break;
      default:
        return LeadsScreen();
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
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottomNavIndex,
        onTap: _onBottomNavTapped,
        items: _bottomNavList,
      ),
    );
  }
}
