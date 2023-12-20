import 'package:flutter/material.dart';

class ResepCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookingTime;
  final String  thumbnailUrl;

  const ResepCard({required this.title, required this.rating, required this.cookingTime, required this.thumbnailUrl});


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
            image: NetworkImage(thumbnailUrl),
            fit: BoxFit.cover
          )
        ),
        child: Stack(children: [Align(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(title, style: TextStyle(fontSize: 19),overflow: TextOverflow.ellipsis,maxLines: 2, textAlign: TextAlign.center,),
          ),
        )],),
      );
    }
}