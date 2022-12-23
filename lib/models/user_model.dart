import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier {
  final String id;
  String nama, email, password, telepon, alamat, createdAt;

  UserModel({
    required this.id,
    required this.nama,
    required this.email,
    required this.password,
    required this.telepon,
    required this.alamat,
    required this.createdAt,
  });
}
