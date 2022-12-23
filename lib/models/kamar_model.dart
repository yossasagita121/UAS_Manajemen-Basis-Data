import 'package:flutter/foundation.dart';

class KamarModel with ChangeNotifier {
  final String id;
  String idKost, idUser, no, harga, air, listrik, luas, createdAt;

  KamarModel({
    required this.id,
    required this.idKost,
    required this.idUser,
    required this.no,
    required this.harga,
    required this.air,
    required this.listrik,
    required this.luas,
    this.createdAt = "",
  });
}
