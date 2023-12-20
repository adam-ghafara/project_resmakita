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
            Text('Resep Makanan')
          ],
        ),
      ),
      body: ResepCard(
        title: 'Kue Marmer',
        rating: '4,9',
        cookingTime: '2 Jam',
        thumbnailUrl: "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/03/17/Resep-Bolu-Marmer-Jadul-2067379807.jpg"),
    );
  }
}
