import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../main.dart';
import '../recipePage/page.dart';
import '../recipePage/new_recipe.dart';
import '../recipePage/edit_recipe.dart';

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

class recipePage extends StatelessWidget {

  const recipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawerViewRecipe(),
    );
  }
}

class DrawerViewRecipe extends StatefulWidget {
  const DrawerViewRecipe({super.key});

  @override
  _DrawerViewRecipeState createState() => _DrawerViewRecipeState();

}

class _DrawerViewRecipeState extends State<DrawerViewRecipe> {

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
          child: ViewRecipe()
      ),
    );
  }
}


class ViewRecipe extends StatefulWidget {
  const ViewRecipe({super.key});

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
        title: Text('${resepMasakan[0].nama_masakan}'),
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
            Text('${resepMasakan[0].nama_masakan}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.blueAccent),
            ),
            Text('Dibuat Oleh: ${resepMasakan[0].penulis_masakan}'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Deskripsi : \n ${resepMasakan[0].deskripsi_masakan}',
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
                'Bahan : \n ${resepMasakan[0].bahan_masakan}',
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
                'Cara Memasak : \n ${resepMasakan[0].cara_masakan}',
                maxLines: 15,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              // put at left
              alignment: Alignment.centerLeft,
              child: ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DrawerEditRecipe()),
                );
            },
            child: Text('Edit Resep Masakan'),
            )
            ),
            Container(
              // put in right
              alignment: Alignment.centerRight,
              child: ElevatedButton(
              onPressed: () {
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
                          // Delete recipe
                          DeleteRecipe(id_masakan: 0).deleteRecipe();
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => MyApp()));
                        },
                        child: Text('Ya'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Hapus Resep Masakan'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            )
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteRecipe {
  final int id_masakan;

  DeleteRecipe({
    required this.id_masakan,
  });

  factory DeleteRecipe.fromJson(Map<String, dynamic> json) {
    return DeleteRecipe(
      id_masakan: json['id_masakan'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id_masakan": id_masakan,
  };

  Future<DeleteRecipe> deleteRecipe() async {
    final response = await http.delete(
      Uri.parse('http://localhost/resmakita/reseps.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(toJson()),
    );
    if (response.statusCode == 200) {
      return DeleteRecipe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete recipe.');
    }
  }
}
