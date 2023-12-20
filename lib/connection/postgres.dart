import 'package:postgres/postgres.dart';

var Connection = PostgreSQLConnection(
    'localhost',
    5432,
    'resmakita',
    username: 'admin',
    password: '12345'
);