class RestoranModel {
  final String nama;
  final String kategori;
  final double rating;
  final String jarak;
  final String gambar;
  bool favorit;

  RestoranModel({
    required this.nama,
    required this.kategori,
    required this.rating,
    required this.jarak,
    required this.gambar,
    this.favorit = false,
  });

  factory RestoranModel.fromJson(Map<String, dynamic> json) {
    return RestoranModel(
      nama: json['nama'] ?? '',
      kategori: json['kategori'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      jarak: json['jarak'] ?? '0 km',
      gambar: json['gambar'] ?? '',
      favorit: json['favorit'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'kategori': kategori,
      'rating': rating,
      'jarak': jarak,
      'gambar': gambar,
      'favorit': favorit,
    };
  }
}
