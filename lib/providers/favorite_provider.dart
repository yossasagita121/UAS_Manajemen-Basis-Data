import 'package:e_kost/models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FavoriteProvider with ChangeNotifier {
  List<FavoriteModel> _favorite = [];

  List<FavoriteModel> favorite(idKost, idUser) {
    return _favorite
        .where((favorite) =>
            favorite.idKost == idKost && favorite.idUser == idUser)
        .toList();
  }

  List<FavoriteModel> favoriteUser(idUser) {
    return _favorite.where((favorite) => favorite.idUser == idUser).toList();
  }

  void clearFavorite() {
    _favorite = [];
  }

  Future initDataFavorite() {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/favorite.json");

    return http.get(url).then(
      (value) {
        var data = json.decode(value.body);
        if (data != null) {
          var data = json.decode(value.body) as Map<String, dynamic>;
          data.forEach(
            (key, value) {
              _favorite.add(
                FavoriteModel(
                  id: key,
                  idKost: value["idKost"],
                  idUser: value["idUser"],
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

  Future addFavorite(idKost, idUser) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/favorite.json");

    return http
        .post(
      url,
      body: json.encode(
        {
          "idKost": idKost,
          "idUser": idUser,
          "createdAt": DateTime.now().toString(),
        },
      ),
    )
        .then(
      (value) {
        _favorite.add(
          FavoriteModel(
            id: json.decode(value.body)["name"].toString(),
            idKost: idKost,
            idUser: idUser,
            createdAt: DateTime.now().toString(),
          ),
        );
        notifyListeners();
      },
    );
  }

  Future deleteFavorite(id) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/favorite/$id.json");

    return http.delete(url).then(
      (value) {
        _favorite.removeWhere((favorite) => favorite.id == id);
        notifyListeners();
      },
    );
  }
}
