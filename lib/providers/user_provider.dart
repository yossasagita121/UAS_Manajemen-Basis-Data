import 'package:e_kost/models/user_model.dart';
import 'package:e_kost/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider with ChangeNotifier {
  List<UserModel> _user = [];

  List<UserModel> _users = [];

  int get jumlaUser => _user.length;

  List<UserModel> get allUser => _user;

  UserModel byLogin() {
    return _user.first;
  }

  UserModel byId(id) {
    return _users.firstWhere((users) => users.id == id);
  }

  void clearUser() {
    _user = [];
    _users = [];
  }

  Future initDataUser() {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/user.json");

    return http.get(url).then(
      (value) {
        var data = json.decode(value.body);
        if (data != null) {
          var data = json.decode(value.body) as Map<String, dynamic>;
          data.forEach(
            (key, value) {
              _user.add(
                UserModel(
                  id: key,
                  nama: value["nama"],
                  telepon: value["telepon"],
                  email: value["email"],
                  password: value["password"],
                  alamat: value["alamat"],
                  createdAt: value["createdAt"],
                ),
              );
              _users.add(
                UserModel(
                  id: key,
                  nama: value["nama"],
                  telepon: value["telepon"],
                  email: value["email"],
                  password: value["password"],
                  alamat: value["alamat"],
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

  Future daftar(nama, telepon, email, password) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/user.json");

    return http
        .post(
      url,
      body: json.encode(
        {
          "nama": nama,
          "telepon": telepon,
          "email": email,
          "password": password,
          "alamat": "",
          "createdAt": DateTime.now().toString(),
        },
      ),
    )
        .then(
      (value) {
        _user.add(
          UserModel(
            id: json.decode(value.body)["name"].toString(),
            nama: nama,
            telepon: telepon,
            email: email,
            password: password,
            alamat: "",
            createdAt: DateTime.now().toString(),
          ),
        );

        _users.add(
          UserModel(
            id: json.decode(value.body)["name"].toString(),
            nama: nama,
            telepon: telepon,
            email: email,
            password: password,
            alamat: "",
            createdAt: DateTime.now().toString(),
          ),
        );
        notifyListeners();
      },
    );
  }

  void login(email, password, context) {
    List<UserModel> user = _user
        .where((user) => user.email == email && user.password == password)
        .toList();
    if (user.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email atau Password Salah!"),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Berhasil!"),
          duration: Duration(seconds: 2),
        ),
      );
      _user = user;
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    }
  }

  Future editUser(id, nama, email, telepon, alamat, password) {
    Uri url = Uri.parse(
        "https://e-kost-a4ca1-default-rtdb.firebaseio.com/e-kost/user/$id.json");

    return http
        .patch(
      url,
      body: json.encode(
        {
          "nama": nama,
          "email": email,
          "telepon": telepon,
          "alamat": alamat,
          "password": password,
        },
      ),
    )
        .then(
      (value) {
        UserModel user = _user.firstWhere((user) => user.id == id);
        user.nama = nama;
        user.email = email;
        user.telepon = telepon;
        user.alamat = alamat;
        user.password = password;

        UserModel users = _users.firstWhere((users) => users.id == id);
        users.nama = nama;
        users.email = email;
        users.telepon = telepon;
        users.alamat = alamat;
        users.password = password;
        notifyListeners();
      },
    );
  }
}
