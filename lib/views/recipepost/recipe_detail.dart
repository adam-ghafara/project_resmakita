import 'package:flutter/material.dart';
import '../../model/recipes.dart';

class DetailScreen extends StatelessWidget {
  final resep reseps;

  const DetailScreen({Key? key, required this.reseps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reseps.name),
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
          Text('${reseps.name}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.blueAccent),
          ),
          Text('Dibuat Oleh: ${reseps.writer}'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Description : \n' + reseps.deskripsi,
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
              'Bahan : \n' + reseps.bahan,
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
              'Tutorial : \n' + reseps.tutorial,
              maxLines: 15,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      ),
      
    );
  }
}
