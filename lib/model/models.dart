import '../connection/postgres.dart';

class Models {
  // Register Model
  String UserRegister = '';
  Future<String> NewAccountReg(
      String fullname, String username, String password) async {
        UserRegister = await AppDatabase().newAccount(fullname, username, password);
        return UserRegister;
      }
  
  // Login Model
  String UserLogin = '';
  Future<String> LoginAccount(String username, String password) async {
    UserLogin = await AppDatabase().login(username, password);
    return UserLogin;
  }

  // New Recipe Model
  String NewRecipe = '';
  Future<String> NewRecipePost(String user_fullname, String nama_masakan, String deskripsi_masakan, String bahan_masakan, String cara_masakan) async {
    NewRecipe = await AppDatabase().newRecipe(user_fullname, nama_masakan, deskripsi_masakan, bahan_masakan, cara_masakan);
    return NewRecipe;
  }

  // Update Recipe Model
  String UpdateRecipe = '';
  Future<String> UpdateRecipePost(String nama_masakan, String deskripsi_masakan, String bahan_masakan, String cara_masakan, String gambar_masakan) async {
    UpdateRecipe = await AppDatabase().updateRecipe(nama_masakan, deskripsi_masakan, bahan_masakan, cara_masakan);
    return UpdateRecipe;
  }

  // Delete Recipe Model
  String DeleteRecipe = '';
  Future<String> DeleteRecipePost(String id_masakan) async {
    DeleteRecipe = await AppDatabase().deleteRecipe(id_masakan);
    return DeleteRecipe;
  }

  String getRecipe = '';
  Future<Recipe> getRecipePost() async {
  Recipe recipe = await AppDatabase().getRecipeStart();

  // Access individual properties of the recipe if needed
  print(recipe.userFullname);
  print(recipe.namaMasakan);
  print(recipe.deskripsiMasakan);
  print(recipe.bahanMasakan);
  print(recipe.caraMasakan);

  // If you want to return the entire Recipe object, you can do so
  return recipe;
}
}