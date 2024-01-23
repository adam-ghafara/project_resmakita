import 'dart:convert';
import 'package:flutter/material.dart';
import '../accounting/login.dart';
import '../../main.dart';
import 'package:http/http.dart' as http;

class NewRecipe extends StatefulWidget {
  const NewRecipe({super.key});
  @override
  _NewRecipeState createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {

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
  final TextEditingController namamasakanController = TextEditingController();
  final TextEditingController deskripsimasakanController = TextEditingController();
  final TextEditingController bahanmasakanController = TextEditingController();
  final TextEditingController caramasakanController = TextEditingController();

  Future<void> NewRecipe() async {
    final String namamasakan = namamasakanController.text;
    final String deskripsimasakan = deskripsimasakanController.text;
    final String bahanmasakan = bahanmasakanController.text;
    final String caramasakan = caramasakanController.text;

    final response = await http.post(
      Uri.parse('http://localhost/resmakita/reseps.php'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'nama_masakan': namamasakan,
        'deskripsi_masakan': deskripsimasakan,
        'bahan_masakan': bahanmasakan,
        'cara_masakan': caramasakan,
      }),
    );
  }

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
            controller: namamasakanController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            style: TextStyle(fontSize: 14)
          ),
          SizedBox(height: 20),
          // Deskripsi Masakan
          Text('Deskripsi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          TextField(
            controller: deskripsimasakanController,
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
            controller: bahanmasakanController,
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
            controller: caramasakanController,
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
              // Verify that the fields should not be empty, and then send the data to the database, and return to main page
              if (namamasakanController.text.isNotEmpty && deskripsimasakanController.text.isNotEmpty && bahanmasakanController.text.isNotEmpty && caramasakanController.text.isNotEmpty) {
                NewRecipe();
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Resep gagal ditambahkan'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }, child: Text('Tambah Resep'),
          ),
        ],
      ),
      )
      ),
      );
  }
}