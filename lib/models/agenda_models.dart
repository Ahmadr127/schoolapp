class AgendaModel {
  final String kdAgenda;
  final String judulAgenda;
  final String isiAgenda;
  final String tglAgenda;
  final String tglPostAgenda;
  final String statusAgenda;
  final String kdPetugas;

  AgendaModel({
    required this.kdAgenda,
    required this.judulAgenda,
    required this.isiAgenda,
    required this.tglAgenda,
    required this.tglPostAgenda,
    required this.statusAgenda,
    required this.kdPetugas,
  });

  factory AgendaModel.fromJson(Map<String, dynamic> json) {
    return AgendaModel(
      kdAgenda: json['kd_agenda'],
      judulAgenda: json['judul_agenda'],
      isiAgenda: json['isi_agenda'],
      tglAgenda: json['tgl_agenda'],
      tglPostAgenda: json['tgl_post_agenda'],
      statusAgenda: json['status_agenda'],
      kdPetugas: json['kd_petugas'],
    );
  }
}