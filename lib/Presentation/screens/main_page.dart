import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // don't forget this
import '../bloc/nav_bloc.dart';
import '../bloc/nav_event.dart';
import '../bloc/nav_state.dart';
import 'home_screen.dart';
import 'detail_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  final List<Widget> _pages = const [
    HomeScreen(),
    DetailScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.selectedIndex,
            children: _pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.selectedIndex,
            onTap: (i) => context.read<NavBloc>().add(NavItemSelected(i)),

            selectedItemColor: Colors.white,       // active icon/text
            unselectedItemColor: Colors.grey,     // inactive icon/text
            backgroundColor: Colors.black,        // nav bar background

            showSelectedLabels: true,
            showUnselectedLabels: true,

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),   // unselected icon
                activeIcon: Icon(Icons.home),      // selected icon
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings),
                label: "Settings",
              ),
            ],
          ),

        );
      },
    );
  }
}
