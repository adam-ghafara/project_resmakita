import 'package:aplikasi_resep_masakan/model/models.dart';
import 'package:aplikasi_resep_masakan/views/new_recipe.dart';
import 'package:flutter/material.dart';
import 'resep_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('ResmaKita')
          ],
        ),
      ),
      body: Column(
        children: [
          Text('Selamat Datang di ResmaKita', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                          spreadRadius: -6.0),
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Cari Resep',
                            hintStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[100],
                          borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: ListView.builder(itemCount: 10,
            itemBuilder: (context, index) {
              final recipes = RecipeData.fromJSON([index]);
              return ResepCard(
            nama_masakan: 'Kue Marmer',
            jenis_masakan: 'Kue',
            gambar_masakan: "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/03/17/Resep-Bolu-Marmer-Jadul-2067379807.jpg");
            },)
            ),
          ],
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new NewRecipePage()));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blueGrey[900],
        ),
    );
  }
}

// class ReturnByteaImage {
//   // Get Bytea from Database and convert to image
//   Future<Image> tinypng() async {
//     // Get Bytea from Database
//     var bytea = await connector();
//     // Convert Bytea to Image
//     var image = Image.memory(bytea);
//     return image;
//   }
// }

      // ResepCard(
      //   nama_masakan: 'Kue Marmer',
      //   jenis_masakan: 'Kue',
      //   gambar_masakan: "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/03/17/Resep-Bolu-Marmer-Jadul-2067379807.jpg"),
