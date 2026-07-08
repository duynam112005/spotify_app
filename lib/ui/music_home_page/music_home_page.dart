import 'package:flutter/material.dart';

import '../discovery_page/discovery_page.dart';
import '../home_page/home_page.dart';
import '../settings_page/settings_page.dart';
import '../user_page/user_page.dart';

class MusicHomePage extends StatefulWidget {
  const MusicHomePage({super.key});

  @override
  State<MusicHomePage> createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
  int _currentIndex = 1;
  final List<Widget> _tabs= [
    const HomePage(),
    const DiscoveryPage(),
    const UserPage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Music App'
        ),
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.album), label: 'Discovery'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
      ],
      onTap: (index){
          setState(() {
            _currentIndex=index;
          });
      },
      selectedItemColor: Colors.deepPurple,),
    );
  }
}
