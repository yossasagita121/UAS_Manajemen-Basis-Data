import 'package:e_kost/models/kamar_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KamarProvider with ChangeNotifier {
  List<KamarModel> _kamar = [];

  int get jumlahKamar => _kamar.length;

  List<KamarModel> get allkamar => _kamar;

  List<KamarModel> byIdKost(idKost) {
    return _kamar.where((kamar) => kamar.idKost == idKost).toList();
  }

  List<KamarModel> byAvailable(idKost) {
    return _kamar
        .where((kamar) => kamar.idKost == idKost && kamar.idUser == "")
        .toList();
  }

  List<KamarModel> byNotAvailable(idKost) {
    return _kamar
        .where((kamar) => kamar.idKost == idKost && kamar.idUser != "")
        .toList();
  }

  KamarModel byId(id) {
    return _kamar.firstWhere((kamar) => kamar.id == id);
  }

  List<KamarModel> byIdUser(idUser) {
    return _kamar.where((kamar) => kamar.idUser == idUser).toList();
  }

  Future initDataKamar() {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kamar.json");

    return http.get(url).then(
      (value) {
        var data = json.decode(value.body);
        if (data != null) {
          var data = json.decode(value.body) as Map<String, dynamic>;
          data.forEach(
            (key, value) {
              _kamar.add(
                KamarModel(
                  id: key,
                  idKost: value["idKost"],
                  idUser: value["idUser"],
                  no: value["no"],
                  harga: value["harga"],
                  air: value["air"],
                  listrik: value["listrik"],
                  luas: value["luas"],
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

  void clearKamar() {
    _kamar = [];
  }

  Future addKamar(idKost, no, harga, air, listrik, luas) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kamar.json");

    return http
        .post(
      url,
      body: json.encode(
        {
          "idKost": idKost,
          "idUser": "",
          "no": no,
          "harga": harga,
          "air": air,
          "listrik": listrik,
          "luas": luas,
          "createdAt": DateTime.now().toString(),
        },
      ),
    )
        .then(
      (value) {
        _kamar.add(
          KamarModel(
            id: json.decode(value.body)["name"].toString(),
            idKost: idKost,
            idUser: "",
            no: no,
            harga: harga,
            air: air,
            listrik: listrik,
            luas: luas,
            createdAt: DateTime.now().toString(),
          ),
        );
        notifyListeners();
      },
    );
  }

  Future editKamar(id, idUser, no, harga, air, listrik, luas) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kamar/$id.json");

    return http
        .patch(
      url,
      body: json.encode(
        {
          "idUser": idUser,
          "no": no,
          "harga": harga,
          "air": air,
          "listrik": listrik,
          "luas": luas,
        },
      ),
    )
        .then(
      (value) {
        KamarModel kamar = _kamar.firstWhere((kamar) => kamar.id == id);
        kamar.idUser = idUser;
        kamar.no = no;
        kamar.harga = harga;
        kamar.air = air;
        kamar.listrik = listrik;
        kamar.luas = luas;
        notifyListeners();
      },
    );
  }

  Future editKamarUser(id, idUser) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kamar/$id.json");

    return http
        .patch(
      url,
      body: json.encode(
        {
          "idUser": idUser,
        },
      ),
    )
        .then(
      (value) {
        KamarModel kamar = _kamar.firstWhere((kamar) => kamar.id == id);
        kamar.idUser = idUser;
        notifyListeners();
      },
    );
  }

  Future deleteKamar(id) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kamar/$id.json");

    return http.delete(url).then(
      (value) {
        _kamar.removeWhere((kamar) => kamar.id == id);
        notifyListeners();
      },
    );
  }
}
