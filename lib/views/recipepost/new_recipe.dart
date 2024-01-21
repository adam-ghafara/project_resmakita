import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import '../../connection/postgres.dart';
import '../accounting/login.dart';
import '../../main.dart';

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
        child: NewRecipePage(),
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

class NewRecipePage extends StatefulWidget {
  const NewRecipePage({super.key});

  @override
  _NewRecipePageState createState() => _NewRecipePageState();
}

class _NewRecipePageState extends State<NewRecipePage> {
  final TextEditingController nama_masakanController = TextEditingController();
  final TextEditingController jenis_masakanController = TextEditingController();
  final TextEditingController gambar_masakanController = TextEditingController();
  final TextEditingController deskripsi_masakanController = TextEditingController();
  final TextEditingController bahan_masakanController = TextEditingController();
  final TextEditingController cara_masakanController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Resep'),
      ),
      body: Padding(padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nama Masakan
          Text('Nama Masakan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          TextField(
            controller: nama_masakanController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            style: TextStyle(fontSize: 14)
          ),
          SizedBox(height: 20),
          // Jenis Masakan
          Text('Jenis Masakan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          TextField(
            controller: jenis_masakanController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            style: TextStyle(fontSize: 14)
          ),
          SizedBox(height: 20),
          // Deskripsi Masakan
          Text('Deskripsi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          TextField(
            controller: deskripsi_masakanController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 80),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(fontSize: 14)
          ),
          SizedBox(height: 20),
          // Bahan Masakan
          Text('Bahan-Bahan untuk memasak masakan ini?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          TextField(
            controller: bahan_masakanController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 80),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(fontSize: 14)
          ),
          SizedBox(height: 20),
          // Cara Masakan
          Text('Tata Cara Masak', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          TextField(
            controller: cara_masakanController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 150),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(fontSize: 14)
          ),
          SizedBox(height: 20),
          // Gambar Masakan
          // Button
          ElevatedButton(
            onPressed: () async {
              PostgreSQLConnection connection = await connector();
              await connection.query('''
                INSERT INTO resep (nama_masakan, jenis_masakan, deskripsi_masakan, bahan_masakan, cara_masakan, gambar_masakan)
                VALUES (@nama_masakan, @jenis_masakan, @deskripsi_masakan, @bahan_masakan, @cara_masakan, @gambar_masakan)
              ''', substitutionValues: {
                'nama_masakan': nama_masakanController.text,
                'jenis_masakan': jenis_masakanController.text,
                'deskripsi_masakan': deskripsi_masakanController.text,
                'bahan_masakan': bahan_masakanController.text,
                'cara_masakan': cara_masakanController.text,
                'gambar_masakan': gambar_masakanController.text,
              });
              Navigator.pop(context);
            },
            child: Text('Tambah Resep'),
          ),
        ],
      ),
      )
      ),
      );
  }
}