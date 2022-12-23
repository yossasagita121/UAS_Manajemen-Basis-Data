import 'package:e_kost/models/penghuni_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PenghuniProvider with ChangeNotifier {
  final List<PenghuniModel> _penghuni = [];

  int get jumlahPenghuni => _penghuni.length;

  List<PenghuniModel> get allPenghuni => _penghuni;

  PenghuniModel byId(id) {
    return _penghuni.firstWhere((penghuni) => penghuni.id == id);
  }

  Iterable<PenghuniModel> byIdKost(idKost) {
    return _penghuni.where((penghuni) => penghuni.idKost == idKost);
  }

  Iterable<PenghuniModel> byIdKamar(idKamar) {
    return _penghuni.where((penghuni) => penghuni.idKamar == idKamar);
  }

  void initDataPenghunit(idKost, idKamar) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kost/$idKost/kamar/$idKamar/penghuni.json");

    http.get(url).then(
      (value) {
        var data = json.decode(value.body);
        if (data != null) {
          var data = json.decode(value.body) as Map<String, dynamic>;
          data.forEach(
            (key, value) {
              _penghuni.add(
                PenghuniModel(
                  idKost: value["idKost"],
                  idKamar: value["idKamar"],
                  id: key,
                  nama: value["nama"],
                  email: value["email"],
                  alamat: value["alamat"],
                  telepon: value["telepon"],
                  pekerjaan: value["pekerjaan"],
                  createdAt: value["createdAt"],
                ),
              );
            },
          );
          notifyListeners();
        }
      },
    );
  }

  Future addPenghuni(idKost, idKamar, nama, email, alamat, telepon, pekerjaan) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kost/$idKost/kamar/$idKamar/penghuni.json");

    return http
        .post(
      url,
      body: json.encode(
        {
          "idKost": idKost,
          "idKamar": idKamar,
          "nama": nama,
          "email": email,
          "alamat": alamat,
          "telepon": telepon,
          "pekerjaan": pekerjaan,
          "createdAt": DateTime.now().toString(),
        },
      ),
    )
        .then(
      (value) {
        _penghuni.add(
          PenghuniModel(
            idKost: idKost,
            idKamar: idKamar,
            id: json.decode(value.body)["name"].toString(),
            nama: nama,
            email: email,
            alamat: alamat,
            telepon: telepon,
            pekerjaan: pekerjaan,
            createdAt: DateTime.now().toString(),
          ),
        );
        notifyListeners();
      },
    );
  }

  Future editPenghuni(
      idKost, idKamar, id, nama, email, alamat, telepon, pekerjaan) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kost/$idKost/kamar/$idKamar/penghuni/$id.json");

    return http
        .patch(
      url,
      body: json.encode(
        {
          "nama": nama,
          "email": email,
          "alamat": alamat,
          "telepon": telepon,
          "pekerjaan": pekerjaan,
        },
      ),
    )
        .then(
      (value) {
        PenghuniModel penghuni =
            _penghuni.firstWhere((penghuni) => penghuni.id == id);
        penghuni.nama = nama;
        penghuni.email = email;
        penghuni.alamat = alamat;
        penghuni.telepon = telepon;
        penghuni.pekerjaan = pekerjaan;
        notifyListeners();
      },
    );
  }

  Future deletePenghuni(idKost, idKamar) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/kost/$idKost/kamar/$idKamar/penghuni.json");

    return http.delete(url).then(
      (value) {
        _penghuni.removeWhere((penghuni) => penghuni.idKamar == idKamar);
        notifyListeners();
      },
    );
  }
}
