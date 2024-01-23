import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../main.dart';
import '../recipePage/page.dart';
import '../recipePage/new_recipe.dart';

class recipePage extends StatelessWidget {
  final ResepMasakan resepMasakan;

  const recipePage({Key? key, required this.resepMasakan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawerBar(),
    );
  }
}

class ResepMasakan {
  final String nama_masakan;
  final String penulis_masakan;
  final String deskripsi_masakan;
  final String bahan_masakan;
  final String cara_masakan;

  ResepMasakan({
    required this.nama_masakan,
    required this.penulis_masakan,
    required this.deskripsi_masakan,
    required this.bahan_masakan,
    required this.cara_masakan,
  });

  factory ResepMasakan.fromJson(Map<String, dynamic> json) {
    return ResepMasakan(
      nama_masakan: json['nama_masakan'],
      penulis_masakan: json['penulis_masakan'],
      deskripsi_masakan: json['deskripsi_masakan'],
      bahan_masakan: json['bahan_masakan'],
      cara_masakan: json['cara_masakan'],
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
                  MaterialPageRoute(builder: (context) => NewRecipe()),
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

class ViewRecipe extends StatefulWidget {
  const ViewRecipe({Key? key}) : super(key: key);

  @override
  _ViewRecipeState createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
  List<ResepMasakan> resepMasakan = [];

  Future<void> getResepMasakan() async {
    final response = await http.get(
      Uri.parse('http://localhost/resmakita/reseps.php'),
    );
    if (response.statusCode == 200) {
      setState(() {
        Iterable List = json.decode(response.body);
        resepMasakan = List.map((model) => ResepMasakan.fromJson(model)).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getResepMasakan();
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Resep'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            Text('',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.blueAccent),
            ),
            Text('Dibuat Oleh: '),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Deskripsi : \n',
                maxLines: 15,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Bahan : \n',
                maxLines: 15,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Cara Memasak : \n',
                maxLines: 15,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => EditRecipe()),
              // );
            },
            child: Text('Edit Resep Masakan'),
            ),
            ElevatedButton(onPressed: () {
              // Show alert dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Hapus Resep Masakan'),
                    content: Text('Apakah anda yakin ingin menghapus resep masakan ini?'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Tidak'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Delete data from database
                          Navigator.pop(context);
                        },
                        child: Text('Ya'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Hapus Resep Masakan'),
            ),
          ],
        ),
      ),
    );
  }
}
