import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import '../../connection/postgres.dart';
import './new_account.dart';
import '../home.dart';
import '../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login ke Akunmu')),
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Align(alignment: Alignment.center,
              child: Column(children: [
                Icon(Icons.restaurant_menu, size: 170,),
                Text("ResmaKita", style: TextStyle(fontSize: 45),)
              ]),),
            ),
            Text('Username',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 14)),
            SizedBox(height: 20),
            // Jenis Masakan
            Text('Password',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 14)),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(onPressed: (

              ) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            }, child: Text('Login', style: TextStyle(fontSize: 17),)),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewAccountPage()),
                  );
                },
                child: Text('Buat Akun Baru'),
              ),
            ),
          ],
        ),
      ),
        ),
    );
  }
}