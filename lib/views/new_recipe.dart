import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import '../connection/postgres.dart';

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