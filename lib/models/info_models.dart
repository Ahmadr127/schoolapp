class InfoModel {
  final int kdInfo;
  final String judulInfo;
  final String isiInfo;
  final DateTime tglPostInfo;
  final String statusInfo;
  final int kdPetugas;

  InfoModel({
    required this.kdInfo,
    required this.judulInfo,
    required this.isiInfo,
    required this.tglPostInfo,
    required this.statusInfo,
    required this.kdPetugas,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      kdInfo: int.parse(json['kd_info']),
      judulInfo: json['judul_info'],
      isiInfo: json['isi_info'],
      tglPostInfo: DateTime.parse(json['tgl_post_info']),
      statusInfo: json['status_info'],
      kdPetugas: int.parse(json['kd_petugas']),
    );
  }
}