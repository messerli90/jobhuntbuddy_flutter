import 'package:flutter/material.dart';

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
      icon: Icon(Icons.person),
      title: Text('Profile'),
    ),
  ];

  Widget _getBody() {
    switch (_selectedBottomNavIndex) {
      case 0:
        return LeadsScreen();
        break;
      case 1:
        return Text('Hello');
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
      ),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottomNavIndex,
        onTap: _onBottomNavTapped,
        items: _bottomNavList,
      ),
      backgroundColor: Colors.blueGrey[100],
    );
  }
}
