import 'recipepost/new_recipe.dart';
import 'package:flutter/material.dart';
import './recipepost/recipe_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Page extends StatelessWidget {
  final int id_masakan;

  const Page({required this.id_masakan});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/detail': (context) => DetailScreen(id_masakan: id_masakan),
        '/new': (context) => NewRecipe(),
      },
      home: HomePage(),
    );
  }
}

class reseps {
  final int id_masakan;
  final String nama_masakan;
  final String penulis_masakan;

  reseps({
    required this.id_masakan,
    required this.nama_masakan,
    required this.penulis_masakan,
  });

  factory reseps.fromJSON(dynamic json) {
    return reseps(
      id_masakan: json['id_masakan'],
      nama_masakan: json['nama_masakan'],
      penulis_masakan: json['penulis_masakan'],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<reseps> _recipes = [];

  Future<void> fetchData() async {
    final response =
    await http.get(Uri.parse('http://localhost/resmakita/reseps.php'));
    
    if (response.statusCode == 200) {
      setState(() {
        Iterable list = json.decode(response.body);
        _recipes = list.map((model) => reseps.fromJSON(model)).toList();
      });
    } 
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
          final resep = _recipes[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 
              '/detail?id_masakan=${resep.id_masakan}',
              );
            },
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