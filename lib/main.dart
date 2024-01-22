import 'dart:io';

import 'package:aplikasi_resep_masakan/views/recipepost/new_recipe.dart';

import 'views/accounting/login.dart';
import 'package:flutter/material.dart';
import 'views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => MyApp(),
        '/newrecipe': (context) => NewRecipePage(),
      },
      title: 'ResmaKita',
      home: DrawerBar(),
    );
  }
}

class DrawerBar extends StatefulWidget {
  const DrawerBar({super.key});
  @override
  _DrawerBarState createState() => _DrawerBarState();
}

class _DrawerBarState extends State<DrawerBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('ResmaKita')
          ],
        ),
      )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: UserInformation(),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap:() => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              ),
            ),
            ListTile(
              leading: Icon(Icons.food_bank),
              title: Text('Tambah Resep Masakan'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewRecipePage()),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorit'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Pengaturan'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Keluar'),
            ),
          ],
        ),
      ),
      body: Center(
        child: HomePage(),
    ),
    );
  }
}

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Show User Information
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(
                'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
          ),
          SizedBox(height: 5),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(
              context,
              '/login',
            );
          }, child: Text('Login')),
          ColoredBox(color: Colors.lightBlue),
        ],
      ),
    );
  }
}

// If theres an Login User

// class UserInformation extends StatefulWidget {
//   const UserInformation({super.key});
//   @override
//   _UserInformationState createState() => _UserInformationState();
// }
//
// class _UserInformationState extends State<UserInformation> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // Show User Information
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 45,
//             backgroundImage: NetworkImage(
//                 'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
//           ),
//           SizedBox(height: 5),
//           Text('Username'),
//           SizedBox(height: 5),
//           ElevatedButton(onPressed: () {}, child: Text('Logout')),
//           ColoredBox(color: Colors.lightBlue),
//         ],
//       ),
//     );
//   }
// }