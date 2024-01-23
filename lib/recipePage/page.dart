import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './view_recipe.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // Navigation bar
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: ListView.builder(
        itemCount: resepMasakan.length,
        itemBuilder: (context, index) {
          final resep = resepMasakan[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewRecipe(),
              ),
            ),
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage('https://i.imgur.com/lKWxFxb.png'),
                              fit: BoxFit.cover)),
                    )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(resep.nama_masakan,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.blueAccent)),
                      Text('Oleh : ${resep.penulis_masakan}'),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}