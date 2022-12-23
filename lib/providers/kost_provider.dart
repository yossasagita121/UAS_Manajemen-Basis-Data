import 'package:e_kost/models/kost_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KostProvider with ChangeNotifier {
  List<KostModel> _kost = [];

  List<KostModel> kostByLogin(idUser) {
    return _kost.where((kost) => kost.idUser == idUser).toList();
  }

  int get jumlahKost => _kost.length;

  List<KostModel> get allkost => _kost;

  KostModel byId(id) {
    return _kost.firstWhere((kost) => kost.id == id);
  }

  List<KostModel> byTransaction(idKost) {
    return _kost.where((kost) => kost.id == idKost).toList();
  }

  void clearKost() {
    _kost = [];
  }

  Future initDataKost() {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kost.json");

    return http.get(url).then(
      (value) {
        var data = json.decode(value.body);
        if (data != null) {
          var data = json.decode(value.body) as Map<String, dynamic>;
          data.forEach(
            (key, value) {
              _kost.add(
                KostModel(
                  id: key,
                  idUser: value["idUser"],
                  nama: value["nama"],
                  no: value["no"],
                  alamat: value["alamat"],
                  deskripsi: value["deskripsi"],
                  createdAt: value["createdAt"],
                  favorite: value["favorite"],
                ),
              );
            },
          );
        }
        notifyListeners();
      },
    );
  }

  Future addKost(idUser, nama, no, alamat, deskripsi) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kost.json");

    return http
        .post(
      url,
      body: json.encode(
        {
          "idUser": idUser,
          "nama": nama,
          "no": no,
          "alamat": alamat,
          "deskripsi": deskripsi,
          "createdAt": DateTime.now().toString(),
          "favorite": 0,
        },
      ),
    )
        .then(
      (value) {
        _kost.add(
          KostModel(
            id: json.decode(value.body)["name"].toString(),
            idUser: idUser,
            nama: nama,
            no: no,
            alamat: alamat,
            deskripsi: deskripsi,
            createdAt: DateTime.now().toString(),
            favorite: 0,
          ),
        );
        notifyListeners();
      },
    );
  }

  Future deleteKost(id) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kost/$id.json");

    return http.delete(url).then(
      (value) {
        _kost.removeWhere((kost) => kost.id == id);
        notifyListeners();
      },
    );
  }

  Future editKost(id, nama, no, alamat, deskripsi) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kost/$id.json");

    return http
        .patch(
      url,
      body: json.encode(
        {
          "nama": nama,
          "no": no,
          "alamat": alamat,
          "deskripsi": deskripsi,
        },
      ),
    )
        .then(
      (value) {
        KostModel kost = _kost.firstWhere((kost) => kost.id == id);
        kost.nama = nama;
        kost.no = no;
        kost.alamat = alamat;
        kost.deskripsi = deskripsi;
        notifyListeners();
      },
    );
  }

  Future editFavorite(id, favorite) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kost/$id.json");

    return http
        .patch(
      url,
      body: json.encode(
        {
          "favorite": favorite,
        },
      ),
    )
        .then(
      (value) {
        KostModel kost = _kost.firstWhere((kost) => kost.id == id);
        kost.favorite = favorite;
        notifyListeners();
      },
    );
  }
}
