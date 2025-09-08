import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // don't forget this
import '../bloc/nav_bloc.dart';
import '../bloc/nav_event.dart';
import '../bloc/nav_state.dart';
import 'home_screen.dart';
import 'detail_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  final List<Widget> _pages = const [HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(index: state.selectedIndex, children: _pages),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // Flutter automatically chooses:
            // - fixed: when you have ≤ 3 items
            // - shifting: when you have > 3 items (like your 5 items)

            // FIXED - all items same size, black background
            // [Home] [Search] [Coming Soon] [Downloads] [More]

            // SHIFTING - selected item larger, may ignore backgroundColor
            //           [home] [SEARCH] [coming] [downloads] [more]
            //        ^^^^^ this one is bigger and more prominent
            currentIndex: state.selectedIndex,
            onTap: (i) => context.read<NavBloc>().add(NavItemSelected(i)),

            selectedItemColor: Colors.white, // active icon/text
            unselectedItemColor: Colors.grey, // inactive icon/text
            backgroundColor: Colors.black, // nav bar background

            showSelectedLabels: true,
            showUnselectedLabels: true,

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), // Unselected
                activeIcon: Icon(Icons.home), // Selected
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                activeIcon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_outline),
                activeIcon: Icon(Icons.play_circle),
                label: "Coming Soon",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.download_outlined),
                activeIcon: Icon(Icons.download),
                label: "Downloads",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_outlined),
                activeIcon: Icon(Icons.menu),
                label: "More",
              ),
            ],
          ),
        );
      },
    );
  }
}
