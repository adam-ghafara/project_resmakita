import '../connection/postgres.dart';

class RecipeData {
  final String nama_masakan;
  final String penulis_masakan;
  final String jenis_masakan;
  final String deskripsi_masakan;
  final String bahan_masakan;
  final String cara_masakan;
  final String gambar_masakan;

  RecipeData({
    required this.nama_masakan,
    required this.penulis_masakan,
    required this.jenis_masakan,
    required this.deskripsi_masakan,
    required this.bahan_masakan,
    required this.cara_masakan,
    required this.gambar_masakan,
  });

  // factory RecipeData.fromJSON(dynamic json) {
  //   return RecipeData(
  //     nama_masakan: json['nama_masakan'],
  //     penulis_masakan: json['penulis_masakan'],
  //     jenis_masakan: json['jenis_masakan'],
  //     deskripsi_masakan: json['deskripsi_masakan'],
  //     bahan_masakan: json['bahan_masakan'],
  //     cara_masakan: json['cara_masakan'],
  //     gambar_masakan: json['gambar_masakan'],
  //   );
  // }
}

// List<RecipeData> getRecipe = [
//   RecipeData(
//   nama_masakan: nama_masakan,
//   penulis_masakan: penulis_masakan,
//   jenis_masakan: jenis_masakan,
//   deskripsi_masakan: deskripsi_masakan,
//   bahan_masakan: bahan_masakan,
//   cara_masakan: cara_masakan,
//   gambar_masakan: gambar_masakan),
// ]

class UserControl {
  final String user_fullname;
  final String r_username;
  final String r_password;

  UserControl({
    required this.user_fullname,
    required this.r_username,
    required this.r_password,
  });

  factory UserControl.fromJSON(dynamic json) {
    return UserControl(
      user_fullname: json['user_fullname'],
      r_username: json['r_username'],
      r_password: json['r_password'],
    );
  }
}