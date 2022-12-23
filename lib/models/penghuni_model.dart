import 'package:flutter/foundation.dart';

class PenghuniModel with ChangeNotifier {
  final String idKost, idKamar, id;
  String nama, email, alamat, telepon, pekerjaan, createdAt;

  PenghuniModel({
    required this.idKost,
    required this.idKamar,
    required this.id,
    required this.nama,
    required this.email,
    required this.alamat,
    required this.telepon,
    required this.pekerjaan,
    required this.createdAt,
  });
}
