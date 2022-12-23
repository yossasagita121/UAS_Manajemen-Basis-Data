import 'package:flutter/foundation.dart';

class FavoriteModel with ChangeNotifier {
  final String id;
  String idKost, idUser, createdAt;

  FavoriteModel({
    required this.id,
    required this.idKost,
    required this.idUser,
    this.createdAt = "",
  });
}
