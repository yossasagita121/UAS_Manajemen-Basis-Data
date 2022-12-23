import 'package:e_kost/pages/checkout.dart';
import 'package:e_kost/pages/checkout_splash.dart';
import 'package:e_kost/pages/daftar.dart';
import 'package:e_kost/pages/favorite.dart';
import 'package:e_kost/pages/home.dart';
import 'package:e_kost/pages/index.dart';
import 'package:e_kost/pages/introduction.dart';
import 'package:e_kost/pages/kamar/kamar.dart';
import 'package:e_kost/pages/kamar/kamar_add.dart';
import 'package:e_kost/pages/kamar/kamar_edit.dart';
import 'package:e_kost/pages/kamar/kamar_manage.dart';
import 'package:e_kost/pages/kost/kost.dart';
import 'package:e_kost/pages/kost/kost_add.dart';
import 'package:e_kost/pages/kost/kost_edit.dart';
import 'package:e_kost/pages/kost/kost_index.dart';
import 'package:e_kost/pages/kost/kost_index_manage.dart';
import 'package:e_kost/pages/kost/kost_manage.dart';
import 'package:e_kost/pages/laporan/laporan.dart';
import 'package:e_kost/pages/laporan/laporan_index.dart';
import 'package:e_kost/pages/laporan/laporan_kost.dart';
import 'package:e_kost/pages/login.dart';
import 'package:e_kost/pages/penghuni/penghuni.dart';
import 'package:e_kost/pages/penghuni/penghuni_add.dart';
import 'package:e_kost/pages/penghuni/penghuni_index.dart';
import 'package:e_kost/pages/penghuni/penghuni_kost.dart';
import 'package:e_kost/pages/profile.dart';
import 'package:e_kost/pages/success_splash.dart';
import 'package:e_kost/pages/voucher.dart';
import 'package:e_kost/providers/favorite_provider.dart';
import 'package:e_kost/providers/kamar_provider.dart';
import 'package:e_kost/providers/kost_provider.dart';
import 'package:e_kost/providers/penghuni_provider.dart';
import 'package:e_kost/providers/transaction_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Color.fromARGB(0, 3, 3, 3)),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => KostProvider()),
        ChangeNotifierProvider(create: (context) => KamarProvider()),
        ChangeNotifierProvider(create: (context) => PenghuniProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyText2:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          primarySwatch: Colors.teal,
        ),
        home: Introduction(),
        routes: {
          Kost.routeName: (context) => Kost(),
          KostManage.routeName: (context) => KostManage(),
          KostIndex.routeName: (context) => KostIndex(),
          KostIndexManage.routeName: (context) => KostIndexManage(),
          KostAdd.routeName: (context) => KostAdd(),
          KostEdit.routeName: (context) => KostEdit(),
          Laporan.routeName: (context) => Laporan(),
          Profile.routeName: (context) => Profile(),
          Kamar.routeName: (context) => Kamar(),
          KamarAdd.routeName: (context) => KamarAdd(),
          KamarEdit.routeName: (context) => KamarEdit(),
          PenghuniAdd.routeName: (context) => PenghuniAdd(),
          Daftar.routeName: (context) => Daftar(),
          Index.routeName: (context) => Index(),
          Login.routeName: (context) => Login(),
          Home.routeName: (context) => Home(),
          Voucher.routeName: (context) => Voucher(),
          Favorite.routeName: (context) => Favorite(),
          Checkout.routeName: (context) => Checkout(),
          CheckoutSplash.routeName: (context) => CheckoutSplash(),
          PenghuniKost.routeName: (context) => PenghuniKost(),
          Penghuni.routeName: (context) => Penghuni(),
          KamarManage.routeName: (context) => KamarManage(),
          PenghuniIndex.routeName: (context) => PenghuniIndex(),
          SuccessSplash.routeName: (context) => SuccessSplash(),
          LaporanKost.routeName: (context) => LaporanKost(),
          LaporanIndex.routeName: (context) => LaporanIndex(),
        },
      ),
    );
  }
}
