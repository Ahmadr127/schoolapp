import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/info_models.dart';
import '../models/agenda_models.dart';
import '../models/gallery_models.dart';
class ApiService {
  static const String baseUrl = 'https://praktikum-cpanel-unbin.com/solev/ujang';

  static Future<List<InfoModel>> getInfoList() async {
    final response = await http.get(Uri.parse('$baseUrl/informasi.php?action=get'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => InfoModel.fromJson(data)).toList();
    } else {
      throw Exception('Gagal memuat data informasi');
    }
  }

  static Future<void> addInfo(InfoModel info) async {
    final response = await http.post(
      Uri.parse('$baseUrl/informasi.php?action=add'),
      body: {
        'judul_info': info.judulInfo,
        'isi_info': info.isiInfo,
        'tgl_post_info': info.tglPostInfo.toIso8601String(),
        'status_info': info.statusInfo,
        'kd_petugas': info.kdPetugas.toString(),
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal menambahkan informasi');
    }
  }

  static Future<void> updateInfo(InfoModel info) async {
    final response = await http.post(
      Uri.parse('$baseUrl/informasi.php?action=update&id=${info.kdInfo}'),
      body: {
        'judul_info': info.judulInfo,
        'isi_info': info.isiInfo,
        'tgl_post_info': info.tglPostInfo.toIso8601String(),
        'status_info': info.statusInfo,
        'kd_petugas': info.kdPetugas.toString(),
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal memperbarui informasi');
    }
  }

  static Future<void> deleteInfo(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/informasi.php?action=delete&id=$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal menghapus informasi');
    }
  }

  static Future<List<AgendaModel>> getAgendaItems() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/agenda.php?action=get'));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((item) => AgendaModel.fromJson(item)).toList();
      } else {
        throw Exception('Gagal memuat data agenda: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  static Future<List<GalleryModel>> getAllGalleries() async {
    final response = await http.get(Uri.parse('$baseUrl/galery.php'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => GalleryModel.fromJson(data)).toList();
    } else {
      throw Exception('Gagal memuat data galeri');
    }
  }

}