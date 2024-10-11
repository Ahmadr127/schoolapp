class GalleryModel {
  final String kdGalery;
  final String judulGalery;
  final String isiGalery;
  final String images;
  final String tglPostGalery;
  final String statusGalery;
  final String kdPetugas;

  GalleryModel({
    required this.kdGalery,
    required this.judulGalery,
    required this.isiGalery,
    required this.images,
    required this.tglPostGalery,
    required this.statusGalery,
    required this.kdPetugas,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      kdGalery: json['kd_galery'],
      judulGalery: json['judul_galery'],
      isiGalery: json['isi_galery'],
      images: 'https://praktikum-cpanel-unbin.com/solev/ujang/galery/${json['images']}',
      tglPostGalery: json['tgl_post_galery'],
      statusGalery: json['status_galery'],
      kdPetugas: json['kd_petugas'],
    );
  }

  String get imageUrl => images;
}