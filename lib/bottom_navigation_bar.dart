// bottom_navigation_bar.dart

import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key); // constructor

  // Het overschrijft de "createState() en gaat de state van je
  // BottomNavBar toe kennen aan de class "_BottomNavBarState()"
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // int _selectedIndex = 0;
  //
  // // static const List<Widget> _pages = <Widget>[
  // //   Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  // //   Center(child: Text('Health Page', style: TextStyle(fontSize: 24))),
  // //   Center(child: Text('Calculator Page', style: TextStyle(fontSize: 24))),
  // //   Center(child: Text('Activity Page', style: TextStyle(fontSize: 24))),
  // // ];
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     //body: _pages[_selectedIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //       items: const <BottomNavigationBarItem>[
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.person),
  //           label: 'Profile',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.favorite),
  //           label: 'Health',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.calculate),
  //           label: 'Calculator',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.directions_run),
  //           label: 'Activity',
  //         ),
  //       ],
  //       currentIndex: _selectedIndex,
  //       selectedItemColor: Colors.pink,
  //       onTap: _onItemTapped,
  //     ),
  //   );
  // }
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
        ]
      );
      // body: <Widget>[
      //   /// Home page
      //   Card(
      //     shadowColor: Colors.transparent,
      //     margin: const EdgeInsets.all(8.0),
      //     child: SizedBox.expand(
      //       child: Center(
      //         child: Text(
      //           'Home page',
      //           style: theme.textTheme.titleLarge,
      //         ),
      //       ),
      //     ),
      //   ),
      //
      //   /// Notifications page
      //   const Padding(
      //     padding: EdgeInsets.all(8.0),
      //     child: Column(
      //       children: <Widget>[
      //         Card(
      //           child: ListTile(
      //             leading: Icon(Icons.notifications_sharp),
      //             title: Text('Notification 1'),
      //             subtitle: Text('This is a notification'),
      //           ),
      //         ),
      //         Card(
      //           child: ListTile(
      //             leading: Icon(Icons.notifications_sharp),
      //             title: Text('Notification 2'),
      //             subtitle: Text('This is a notification'),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      //
      //   /// Messages page
      //   ListView.builder(
      //     reverse: true,
      //     itemCount: 2,
      //     itemBuilder: (BuildContext context, int index) {
      //       if (index == 0) {
      //         return Align(
      //           alignment: Alignment.centerRight,
      //           child: Container(
      //             margin: const EdgeInsets.all(8.0),
      //             padding: const EdgeInsets.all(8.0),
      //             decoration: BoxDecoration(
      //               color: theme.colorScheme.primary,
      //               borderRadius: BorderRadius.circular(8.0),
      //             ),
      //             child: Text(
      //               'Hello',
      //               style: theme.textTheme.bodyLarge!
      //                   .copyWith(color: theme.colorScheme.onPrimary),
      //             ),
      //           ),
      //         );
      //       }
      //       return Align(
      //         alignment: Alignment.centerLeft,
      //         child: Container(
      //           margin: const EdgeInsets.all(8.0),
      //           padding: const EdgeInsets.all(8.0),
      //           decoration: BoxDecoration(
      //             color: theme.colorScheme.primary,
      //             borderRadius: BorderRadius.circular(8.0),
      //           ),
      //           child: Text(
      //             'Hi!',
      //             style: theme.textTheme.bodyLarge!
      //                 .copyWith(color: theme.colorScheme.onPrimary),
      //           ),
      //         ),
      //       );
      //     },
      //   ),
      // ][currentPageIndex],
  }
}
