import 'package:flutter/material.dart';
import '../connection/postgres.dart';

class ResepCard extends StatelessWidget {
  final String nama_masakan;
  final String jenis_masakan;
  final String gambar_masakan;

  const ResepCard({ required this.nama_masakan, required this.jenis_masakan, required this.gambar_masakan });

    @override 
    Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
            spreadRadius: -6.0),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
            image: NetworkImage(gambar_masakan),
            fit: BoxFit.cover
          )
        ),
        child: Stack(children: [Align(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nama_masakan, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 5),
                  Text('Jenis Masakan: $jenis_masakan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                ],
              ),
            ),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                  Text('Penulis: Ahmad Fauzi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
            ],)),
            Icon(Icons.favorite, color: Colors.red[400], size: 30)
          ],),
          ),
          alignment: Alignment.center,
        )],),
      );
    }
}