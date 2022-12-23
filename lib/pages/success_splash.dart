import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessSplash extends StatefulWidget {
  static const routeName = '/successSplash';

  @override
  State<SuccessSplash> createState() => _SuccessSplashState();
}

class _SuccessSplashState extends State<SuccessSplash> {
  bool isSplash = false;

  @override
  Widget build(BuildContext context) {
    if (!isSplash) {
      Future.delayed(const Duration(milliseconds: 3200), () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Transaksi berhasil!"),
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.of(context).popUntil((route) => route.isFirst);
      });
      isSplash = true;
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: Lottie.asset(
            'lotties/splash2.json',
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
