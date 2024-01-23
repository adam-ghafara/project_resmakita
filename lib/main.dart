import 'package:flutter/material.dart';
import './recipePage/page.dart';
import './recipePage/new_recipe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DrawerBar(),
  );
  }
}

// Drawer Bar

class DrawerBar extends StatefulWidget {
  const DrawerBar({super.key});

  @override
  _DrawerBarState createState() => _DrawerBarState();

}

class _DrawerBarState extends State<DrawerBar> {

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ResmaKita'),),
      drawer: Drawer(
        child: 
        ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'ResmaKita',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline_rounded),
              title: Text('Tambah Resep Masakan Baru'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DrawerBarNewRecipe()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: HomePage(),
      ),
    );
  }
}
