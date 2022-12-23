import 'package:e_kost/pages/checkout.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CheckoutSplash extends StatefulWidget {
  // const CheckoutSplash({super.key});
  static const routeName = '/checkoutSplash';

  @override
  State<CheckoutSplash> createState() => _CheckoutSplashState();
}

class _CheckoutSplashState extends State<CheckoutSplash> {
  bool isSplash = false;

  @override
  Widget build(BuildContext context) {
    final idKamar = ModalRoute.of(context)!.settings.arguments as String;
    if (!isSplash) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.of(context).pushReplacementNamed(
          Checkout.routeName,
          arguments: idKamar,
        );
      });
      isSplash = true;
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 19, 136, 23),
        child: Center(
          child: Lottie.asset(
            'lotties/splash.json',
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
