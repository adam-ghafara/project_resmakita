import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import '../main.dart';
import '../loginPage/login.dart';

class DrawerBarNewRecipe extends StatefulWidget {
  const DrawerBarNewRecipe({super.key});

  @override
  _DrawerBarNewRecipeState createState() => _DrawerBarNewRecipeState();
}

class _DrawerBarNewRecipeState extends State<DrawerBarNewRecipe> {
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
              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text('Login'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
            ],
          ),
        ),
        body: const Center(
            child: NewRecipe()
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

class NewRecipe extends StatefulWidget {
  const NewRecipe({Key? key}) : super(key: key);

  // Navigation bar
  @override
  _NewRecipeState createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {
  final TextEditingController nama_masakan = TextEditingController();
  final TextEditingController penulis_masakan = TextEditingController();
  final TextEditingController deskripsi_masakan = TextEditingController();
  final TextEditingController bahan_masakan = TextEditingController();
  final TextEditingController cara_masakan = TextEditingController();

  Future<void> CreateRecipe() async {

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
          msg: "Data berhasil ditambahkan");
          Navigator.pop(context, true);
    } else {
      Fluttertoast.showToast(
          msg: "Data gagal ditambahkan");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(child: 
      Column(
        children: [
          Text('Tambah Resep Masakan Baru', style: TextStyle(fontSize: 35.0)),
          const SizedBox(height: 20.0,),
          Text('Nama Masakan', style: TextStyle(fontSize: 14.0), textAlign: TextAlign.left,),
          TextField(
            controller: nama_masakan,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nama Masakan',
            ),
          ),
          const SizedBox(height: 20.0,),
          Text('Penulis Masakan', style: TextStyle(fontSize: 14.0), textAlign: TextAlign.left,),
          TextField(
            controller: penulis_masakan,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Penulis Masakan',
            ),
          ),
          const SizedBox(height: 20.0,),
          Text('Deskripsi Masakan', style: TextStyle(fontSize: 14.0), textAlign: TextAlign.left,),
          TextFormField(
            controller: deskripsi_masakan,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Deskripsi Masakan',
            ),
            // Resize Form height
            maxLines: 5,
          ),
          const SizedBox(height: 20.0,),
          Text('Masukkan Bahan-Bahan untuk Masakan ini', style: TextStyle(fontSize: 14.0), textAlign: TextAlign.left,),
          TextFormField(
            controller: bahan_masakan,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Bahan Masakan',
            ),
            maxLines: 7,
          ),
          const SizedBox(height: 20.0,),
          Text('Tunjukkan Cara Memasaknya', style: TextStyle(fontSize: 14.0), textAlign: TextAlign.left,),
          TextFormField(
            controller: cara_masakan,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Cara Masakan',
            ),
            maxLines: 10,
          ),
          const SizedBox(height: 20.0,),
          ElevatedButton(
            onPressed: () {
              // check if the should be filled
              if (nama_masakan.text.isEmpty ||
                  penulis_masakan.text.isEmpty ||
                  deskripsi_masakan.text.isEmpty ||
                  bahan_masakan.text.isEmpty ||
                  cara_masakan.text.isEmpty) {
                Fluttertoast.showToast(
                    msg: "Harap isi semua kolom!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.redAccent,);
              } else if (nama_masakan.text.isNotEmpty ||
                  penulis_masakan.text.isNotEmpty ||
                  deskripsi_masakan.text.isNotEmpty ||
                  bahan_masakan.text.isNotEmpty ||
                  cara_masakan.text.isNotEmpty) {
                showDialog(context: context, builder:
                    (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Konfirmasi'),
                    content: const Text('Apakah anda yakin ingin menambahkan resep masakan ini?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Tidak'),
                      ),
                      TextButton(
                        onPressed: () {
                          CreateRecipe();
                        },
                        child: const Text('Ya'),
                      ),
                    ],
                  );
                });
              }
            },
            child: const Text('Tambah Resep Masakan'),
          ),
        ],
      ),
      )),
    );
  }
}