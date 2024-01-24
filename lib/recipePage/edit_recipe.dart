import 'package:aplikasi_resep_masakan/recipePage/new_recipe.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import '../main.dart';

class DrawerEditRecipe extends StatefulWidget {
  const DrawerEditRecipe({super.key});

  @override
  _DrawerEditRecipeState createState() => _DrawerEditRecipeState();

}

class _DrawerEditRecipeState extends State<DrawerEditRecipe> {
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
        child: EditRecipe(),
      ),
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

class EditRecipe extends StatefulWidget {
  const EditRecipe({Key? key}) : super(key: key);

  // Navigation bar
  @override
  _EditRecipeState createState() => _EditRecipeState();
}

class _EditRecipeState extends State<EditRecipe> {
  final TextEditingController nama_masakan = TextEditingController();
  final TextEditingController penulis_masakan = TextEditingController();
  final TextEditingController deskripsi_masakan = TextEditingController();
  final TextEditingController bahan_masakan = TextEditingController();
  final TextEditingController cara_masakan = TextEditingController();

  Future<void> EditRecipe() async {

  final response = await http.post(
    Uri.parse("http://localhost/resmakita/reseps.php"),
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: jsonEncode(<String, String>{
      'nama_masakan': nama_masakan.text,
      'penulis_masakan': penulis_masakan.text,
      'deskripsi_masakan': deskripsi_masakan.text,
      'bahan_masakan': bahan_masakan.text,
      'cara_masakan': cara_masakan.text,
    }),
  );

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Data berhasil Di edit");
          Navigator.pop(context, true);
    } else {
      Fluttertoast.showToast(
          msg: "Data gagal di edit");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(child: 
      Column(
        children: [
          Text('Edit Resep Masakan', style: TextStyle(fontSize: 35.0)),
          const SizedBox(height: 20.0,),
          TextField(
            controller: nama_masakan,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nama Masakan',
            ),
          ),
          const SizedBox(height: 20.0,),
          TextField(
            controller: penulis_masakan,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Penulis Masakan',
            ),
          ),
          const SizedBox(height: 20.0,),
          TextFormField(
            controller: deskripsi_masakan,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Deskripsi Masakan',
            ),
          ),
          const SizedBox(height: 20.0,),
          TextFormField(
            controller: bahan_masakan,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Bahan Masakan',
            ),
          ),
          const SizedBox(height: 20.0,),
          TextFormField(
            controller: cara_masakan,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Cara Masakan',
            ),
          ),
          const SizedBox(height: 20.0,),
          ElevatedButton(
            onPressed: () {
              EditRecipe();
            },
            child: const Text('Terapkan Pengeditan'),
          ),
        ],
      ),
      )),
    );
  }
}