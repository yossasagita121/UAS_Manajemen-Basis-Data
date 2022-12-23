import 'package:flutter/foundation.dart';

class TransactionModel with ChangeNotifier {
  final String id;
  String idTransaction,
      idKost,
      idKamar,
      idUser,
      dateIn,
      dateOut,
      metodeBayar,
      total,
      createdAt;

  TransactionModel({
    required this.id,
    required this.idTransaction,
    required this.idKost,
    required this.idKamar,
    required this.idUser,
    required this.dateIn,
    required this.dateOut,
    required this.metodeBayar,
    required this.total,
    this.createdAt = "",
  });
}
