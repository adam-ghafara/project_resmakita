import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import '../connection/postgres.dart';
import 'models.dart';
import '../views/accounting/login.dart';
import '../model/recipes.dart';


class RecipeView extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecipeView(),
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
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: UserInformation(),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }, child: Text('Login')),
          ColoredBox(color: Colors.lightBlue),
        ],
      ),
    );
  }
}

class RecipeData {
  final String name;
  final String htm;
  final String deskripsi;
  final String bahan;
  final String tutorial;
  final String image;

  RecipeData({
    required this.name,
    required this.htm,
    required this.deskripsi,
    required this.bahan,
    required this.tutorial,
    required this.image,
  });

  factory RecipeData.fromJSON(Map<String, dynamic> json) {
    return RecipeData(
      name: json['name'],
      htm: json['htm'],
      deskripsi: json['deskripsi'],
      bahan: json['bahan'],
      tutorial: json['tutorial'],
      image: json['image'],
    );
  }
}

class RecipeViewPage extends StatefulWidget {
  final resep reseps;

  const RecipeViewPage({Key? key, required this.reseps}) : super(key: key);

  @override
  _RecipeViewPageState createState() => _RecipeViewPageState();
}

class _RecipeViewPageState extends State<RecipeViewPage> {
  final List<RecipeData> recipes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                'https://i.imgur.com/lKWxFxb.png',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'reseps.name',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.blueAccent),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Description : \n reseps.tutorial',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(16.0),
          child: Text('Bahan-Bahan untuk memasak masakan ini?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black))),
          Padding(padding: const EdgeInsets.all(16.0),
          child: Text(recipes[0].bahan, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black))),
          Padding(padding: const EdgeInsets.all(16.0),
          child: Text('Cara Memasak Masakan ini?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black))),
          Padding(padding: const EdgeInsets.all(16.0),
          child: Text(recipes[0].tutorial, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black))),
        ],
      ),
    );
  }
}