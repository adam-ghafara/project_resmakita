import 'package:postgres/postgres.dart';

class Recipe {
  String userFullname;
  String namaMasakan;
  String deskripsiMasakan;
  String bahanMasakan;
  String caraMasakan;

  Recipe({
    required this.userFullname,
    required this.namaMasakan,
    required this.deskripsiMasakan,
    required this.bahanMasakan,
    required this.caraMasakan,
  });
}

class AppDatabase {
  String id_masakan = '';
  String user_fullname = '';
  String nama_masakan = '';
  String deskripsi_masakan = '';
  String bahan_masakan = '';
  String cara_masakan = '';



  PostgreSQLConnection? sqlConnection;
  PostgreSQLResult? NewAccountResult, NewRecipeResult;
  PostgreSQLResult? AccountExistedResult;

  PostgreSQLResult? loginResult, registerResult;

  PostgreSQLResult? updateRecipeResult;

  static String? r_username;
  static String? r_password;

  PostgreSQLResult? _fetchUserDataResult;

  AppDatabase() {
    sqlConnection = (sqlConnection == null || sqlConnection!.isClosed == true)
        ? PostgreSQLConnection(
            'localhost',
            5432,
            'super4reci',
            username: 'admin',
            password: '12345',
          )
        : sqlConnection;

    fetchDataFuture = [];
  }

  String NewAccountProcedure = '';
  Future <String> newAccount(String user_fullname, String r_username, String r_password) async {
    try {
      await sqlConnection!.open();
      await sqlConnection!.transaction((NewAccountConnection) async {
        AccountExistedResult = await NewAccountConnection.query('SELECT * FROM users WHERE user_username = @r_username',
        substitutionValues: { 'r_username': r_username
        },
        allowReuse: true,
        timeoutInSeconds: 30,
        );
        if (AccountExistedResult!.affectedRowCount > 0) {
          NewAccountProcedure = 'alr';
        } else {
          NewAccountResult = await NewAccountConnection.query('INSERT INTO users (user_fullname, user_username, user_password) VALUES (@user_fullname, @r_username, @r_password)',
          substitutionValues: {
            'user_fullname': user_fullname,
            'r_username': r_username,
            'r_password': r_password,
          },
          allowReuse: true,
          timeoutInSeconds: 30,
          );
          NewAccountProcedure = 
          (NewAccountResult!.affectedRowCount > 0) ? 'success' : 'failed';
        }
        });
  } catch (exception) {
    NewAccountProcedure = 'exception';
    exception.toString();
  }
  return NewAccountProcedure;
}

String NewRecipeProcedure = '';
Future <String> newRecipe(String user_fullname, String nama_masakan, String deskripsi_masakan, String bahan_masakan, String cara_masakan) async {
  try {
    await sqlConnection!.open();
    await sqlConnection!.transaction((NewRecipeConnection) async {
      NewRecipeResult = await NewRecipeConnection.query('INSERT INTO resmaresep (user_fullname, nama_masakan, deskripsi_masakan, bahan_masakan, cara_masakan) VALUES (@user_fullname, @nama_masakan, @deskripsi_masakan, @bahan_masakan, @cara_masakan)',
      substitutionValues: {
        'user_fullname': user_fullname,
        'nama_masakan': nama_masakan,
        'deskripsi_masakan': deskripsi_masakan,
        'bahan_masakan': bahan_masakan,
        'cara_masakan': cara_masakan,
      },
      allowReuse: true,
      timeoutInSeconds: 30,
      );
      NewRecipeProcedure = 
      (NewRecipeResult!.affectedRowCount > 0) ? 'success' : 'failed';
    });
  } catch (exception) {
    NewRecipeProcedure = 'exception';
    exception.toString();
  }
  return NewRecipeProcedure;
}

String LoginProcedure = '';
Future <String> login(String r_username, String r_password) async {
  try {
    await sqlConnection!.open();
    await sqlConnection!.transaction((loginConnection) async {
      loginResult = await loginConnection.query('SELECT * FROM users WHERE user_username = @r_username AND user_password = @r_password',
      substitutionValues: {
        'r_username': r_username,
        'r_password': r_password,
      },
      allowReuse: true,
      timeoutInSeconds: 30,
      );
      LoginProcedure = 
      (loginResult!.affectedRowCount > 0) ? 'success' : 'failed';
    });
  } catch (exception) {
    LoginProcedure = 'exception';
    exception.toString();
  }
  return LoginProcedure;
}

String GetRecipeProcedure = '';
Future <String> getRecipe() async {
  try {
    await sqlConnection!.open();
    await sqlConnection!.transaction((getRecipeConnection) async {
      _fetchUserDataResult = await getRecipeConnection.query('SELECT * FROM resmaresep JOIN users ON resmaresep.user_fullname = users.user_fullname');
      GetRecipeProcedure = 
      (_fetchUserDataResult!.affectedRowCount > 0) ? 'success' : 'failed';
    });
  } catch (exception) {
    GetRecipeProcedure = 'exception';
    exception.toString();
  }
  return GetRecipeProcedure;
}

Future<Recipe> getRecipeStart() async {
    // Fetch the data from your database
    // For demonstration purposes, I'm using hardcoded values
    String userFullname = "";
    String namaMasakan = "";
    String deskripsiMasakan = "";
    String bahanMasakan = "";
    String caraMasakan = "";

    // Create a Recipe object with the fetched data
    Recipe recipe = Recipe(
      userFullname: userFullname,
      namaMasakan: namaMasakan,
      deskripsiMasakan: deskripsiMasakan,
      bahanMasakan: bahanMasakan,
      caraMasakan: caraMasakan,
    );

    return recipe;
  }

String UpdateRecipeProcedure = '';
Future <String> updateRecipe(String nama_masakan, String deskripsi_masakan, String bahan_masakan, String cara_masakan) async {
  try {
    await sqlConnection!.open();
    await sqlConnection!.transaction((updateRecipeConnection) async {
      updateRecipeResult = await updateRecipeConnection.query('UPDATE resmaresep SET nama_masakan = @nama_masakan, deskripsi_masakan = @deskripsi_masakan, bahan_masakan = @bahan_masakan, cara_masakan = @cara_masakan WHERE nama_masakan = @nama_masakan',
      substitutionValues: {
        'nama_masakan': nama_masakan,
        'deskripsi_masakan': deskripsi_masakan,
        'bahan_masakan': bahan_masakan,
        'cara_masakan': cara_masakan,
      },
      allowReuse: true,
      timeoutInSeconds: 30,
      );
      UpdateRecipeProcedure = 
      (updateRecipeResult!.affectedRowCount > 0) ? 'success' : 'failed';
    });
  } catch (exception) {
    UpdateRecipeProcedure = 'exception';
    exception.toString();
  }
  return UpdateRecipeProcedure;
}

String DeleteRecipeProcedure = '';
Future <String> deleteRecipe(String nama_masakan) async {
  try {
    await sqlConnection!.open();
    await sqlConnection!.transaction((deleteRecipeConnection) async {
      updateRecipeResult = await deleteRecipeConnection.query('DELETE FROM resmaresep WHERE id_masakan = @id_masakan',
      substitutionValues: {
        'id_masakan': id_masakan,
      },
      allowReuse: true,
      timeoutInSeconds: 30,
      );
      DeleteRecipeProcedure = 
      (updateRecipeResult!.affectedRowCount > 0) ? 'success' : 'failed';
    });
  } catch (exception) {
    DeleteRecipeProcedure = 'exception';
    exception.toString();
  }
  return DeleteRecipeProcedure;
}

List<dynamic> fetchDataFuture = [];
Future<List<dynamic>> fetchUserData(String username) async {
  try {
    await sqlConnection!.open();
    await sqlConnection!.transaction((fetchUserDataConnection) async {
      _fetchUserDataResult = await fetchUserDataConnection.query('SELECT * FROM users WHERE user_username = @username',
      substitutionValues: {
        'username': username,
      },
      allowReuse: false,
      timeoutInSeconds: 30,
      );
      if (_fetchUserDataResult!.affectedRowCount > 0) {
        fetchDataFuture = _fetchUserDataResult!.first.toList(growable: true);
      } else {
        fetchDataFuture = [];
      }
    });
  } catch (exception) {
    fetchDataFuture = [];
    exception.toString();
  }
  return fetchDataFuture;
}
}


// Future connector() async {
// List<RecipeData> recipes = [];

// var Connection = PostgreSQLConnection(
//     'localhost',
//     5432,
//     'super4reci',
//     username: 'admin',
//     password: '12345'
// );

// try {
//   await Connection.open();
//   print('Database connected');
// } catch (e) {
//   print('Database connection failed');
//   print(e);
// }

// Future<void> getRecipe() async {
//     final response =
//     await Connection.query('SELECT * FROM resmaresep JOIN users ON resmaresep.penulis_masakan = users.user_fullname');
//     if (response != null) {
//       for (var i = 0; i < response.length; i++) {
//         recipes.add(RecipeData.fromJSON(response[i]));
//       }
//   }
// }


// 
// Future<List<UserControl>> getUsers() async {
//   List<List<dynamic>> results = await Connection.query('SELECT * FROM users');
//   List<UserControl> users = results.map((item) => UserControl.fromJSON(item)).toList();
//   return users;
// }