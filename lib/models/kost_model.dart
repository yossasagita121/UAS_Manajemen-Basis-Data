import 'package:flutter/foundation.dart';

class KostModel with ChangeNotifier {
  final String id;
  String idUser, nama, no, alamat, createdAt;
  String deskripsi;
  int favorite;

  KostModel({
    required this.id,
    required this.idUser,
    required this.nama,
    required this.no,
    required this.alamat,
    this.deskripsi = "",
    required this.createdAt,
    this.favorite = 0,
  });
}
