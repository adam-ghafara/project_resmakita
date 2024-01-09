

class RecipeData extends {
  final String nama_masakan;
  final String jenis_masakan;
  final String deskripsi_masakan;
  final String bahan_masakan;
  final String cara_masakan;

  RecipeData({required this.nama_masakan, required this.jenis_masakan, required this.deskripsi_masakan, required this.bahan_masakan, required this.cara_masakan});

  factory RecipeData.fromJSON(dynamic json) {
    return RecipeData(
      nama_masakan: json['nama_masakan'],
      jenis_masakan: json['jenis_masakan'],
      deskripsi_masakan: json['deskripsi_masakan'],
      bahan_masakan: json['bahan_masakan'],
      cara_masakan: json['cara_masakan'],
    );
  }

  static Future<RecipeData> insertData('nama_masakan', 'jenis_masakan', 'deskripsi_masakan', 'bahan_masakan', 'cara_masakan') async {
    return RecipeData.fromJSON(RecipeData(json));

  }
}