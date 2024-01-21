import '../connection/postgres.dart';



class resep {
  final String name;
  final String writer;
  final String deskripsi;
  final String bahan;
  final String tutorial;
  final String image;

  resep({
    required this.name,
    required this.writer,
    required this.deskripsi,
    required this.bahan,
    required this.tutorial,
    required this.image,
  });

  factory resep.fromJSON(dynamic json) {
    return resep(
      name: json['nama_masakan'],
      writer: json['penulis_masakan'],
      deskripsi: json['deskripsi_masakan'],
      bahan: json['bahan_masakan'],
      tutorial: json['cara_masakan'],
      image: json['image'],
    );
  }
}

List<resep> dataResep = [
  resep(
      name: 'Nestum Cookies',
      writer: 'Rizky Maulana',
      deskripsi: 'lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
      bahan: '1. 200 gr tepung terigu\n 2. 100 gr margarin\n 3. 100 gr butter\n 4. 100 gr gula halus\n 5. 2 kuning telur\n 6. 1 sdt baking powder\n 7. 1 bungkus nestum\n 8. Kacang almond untuk topping',
      tutorial:
          '1. Mixer butter, margarine dan gula halus kira-kira 1 menit lalu masukkan kuning telur, mixer sebentar saja, asal rata, cukupkan\n 2. Ayak tepung dan baking powder lalu masukkan ke adonan, aduk rata gunakan spatula\n 3. Terakhir masukkan nestum, aduk rata\n 4. Siapkan loyang anti lengket atau alasi loyang dgn baking paper, bentuk bulat lalu pipihkan atau bentuk sesuai selera, beri topping kacang almond\n 5. Panggang dengan suhu 150 DC selama 20 menit.\n',
      image: '../assets/img/nestumcookies.jpeg'),
];