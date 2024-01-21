import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import '../../connection/postgres.dart';

class NewAccountPage extends StatefulWidget {
  const NewAccountPage({super.key});

  @override
  _NewAccountPageState createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Akun Baru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(children: [
                    Icon(
                      Icons.restaurant_menu,
                      size: 170,
                    ),
                    Text(
                      "ResmaKita",
                      style: TextStyle(fontSize: 45),
                    )
                  ]),
                ),
              ),
              Text('Nama Lengkap',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              TextField(
                  controller: fullnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 14)),
              SizedBox(height: 20),
              // Jenis Masakan
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
              // Deskripsi Masakan
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
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                  onPressed: () {
                    connector().then((conn) {
                      conn.query(
                          'INSERT INTO users (user_fullname, r_username, r_password) VALUES (@fullname, @username, @password)',
                          substitutionValues: {
                            'user_fullname': fullnameController.text,
                            'r_username': usernameController.text,
                            'r_password': passwordController.text
                          });
                      Navigator.pop(context);
                    });
                  },
                  child: Text('Buat Akun'))
              ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}