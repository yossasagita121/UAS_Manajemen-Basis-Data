import 'package:e_kost/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TransactionProvider with ChangeNotifier {
  List<TransactionModel> _transaction = [];

  int get jumlahTransaction => _transaction.length;

  List<TransactionModel> get allTransaction => _transaction;

  TransactionModel byId(id) {
    return _transaction.firstWhere((transaction) => transaction.id == id);
  }

  List<TransactionModel> byIdKost(idKost) {
    return _transaction
        .where((transaction) => transaction.idKost == idKost)
        .toList();
  }

  List<TransactionModel> byIdUser(idUser) {
    return _transaction
        .where((transaction) => transaction.idUser == idUser)
        .toList();
  }

  void clearTransaction() {
    _transaction = [];
  }

  Future initDataTransaction() {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/transaction.json");

    return http.get(url).then(
      (value) {
        var data = json.decode(value.body);
        if (data != null) {
          var data = json.decode(value.body) as Map<String, dynamic>;
          data.forEach(
            (key, value) {
              _transaction.add(
                TransactionModel(
                  id: key,
                  idTransaction: value["idTransaction"],
                  idKost: value["idKost"],
                  idKamar: value["idKamar"],
                  idUser: value["idUser"],
                  dateIn: value["dateIn"],
                  dateOut: value["dateOut"],
                  metodeBayar: value["metodeBayar"],
                  total: value["total"],
                  createdAt: value["createdAt"],
                ),
              );
            },
          );
        }
        notifyListeners();
      },
    );
  }

  Future addTransaction(idKost, idKamar, idUser, dateIn, dateOut, total) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/transaction.json");

    return http
        .post(
      url,
      body: json.encode(
        {
          "idTransaction": "#${DateTime.now()}",
          "idKost": idKost,
          "idKamar": idKamar,
          "idUser": idUser,
          "dateIn": dateIn,
          "dateOut": dateOut,
          "metodeBayar": "cash",
          "total": total,
          "createdAt": DateTime.now().toString(),
        },
      ),
    )
        .then(
      (value) {
        _transaction.add(
          TransactionModel(
            id: json.decode(value.body)["name"].toString(),
            idTransaction: "#${DateTime.now()}",
            idKamar: idKamar,
            idKost: idKost,
            idUser: idUser,
            dateIn: dateIn,
            dateOut: dateOut,
            metodeBayar: "cash",
            total: total,
            createdAt: DateTime.now().toString(),
          ),
        );
        notifyListeners();
      },
    );
  }
}
