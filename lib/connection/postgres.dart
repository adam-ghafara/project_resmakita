import 'package:postgres/postgres.dart';

var Connection = PostgreSQLConnection(
    'localhost',
    5432,
    'resmakita',
    username: 'admin',
    password: '12345'
);

initDatabaseConnection() async {
  Connection.open().then((value) {
    print('Database connected');
  }).catchError((error) {
    print('Database connection failed');
    print(error);
  });
  List<Map<String, dynamic>> result = await Connection.mappedResultsQuery("SELECT * FROM resmakita",
      substitutionValues: {
        'id': 1,
      }
  );
}
