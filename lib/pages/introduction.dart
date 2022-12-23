import 'package:e_kost/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});
  @override
  Widget build(BuildContext context) {
    List<PageViewModel> listPagesViewModel = [
      PageViewModel(
        titleWidget: Text(
          "Welcome!",
          style: GoogleFonts.signika(
            textStyle: const TextStyle(
              color: Color(0xff01b399),
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        bodyWidget: Container(
          width: 350,
          height: 350,
          child: Lottie.asset('lotties/intro1.json'),
        ),
        footer: Text(
          "Selamat datang di aplikasi E-Kost",
          style: GoogleFonts.signika(
            textStyle: const TextStyle(
              color: Color(0xff01b399),
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      PageViewModel(
        titleWidget: Text(
          "Getting Started",
          style: GoogleFonts.signika(
            textStyle: const TextStyle(
              color: Color(0xff01b399),
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        bodyWidget: Container(
          width: 350,
          height: 350,
          child: Lottie.asset('lotties/intro2.json'),
        ),
        footer: Text(
          "Membantu pengalaman anda dalam mencari kost. Cari kost? disini aja!",
          style: GoogleFonts.signika(
            textStyle: const TextStyle(
              color: Color(0xff01b399),
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      PageViewModel(
        titleWidget: Text(
          "Thank You!",
          style: GoogleFonts.signika(
            textStyle: const TextStyle(
              color: Color(0xff01b399),
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        bodyWidget: Container(
          width: 350,
          height: 350,
          child: Lottie.asset('lotties/intro3.json'),
        ),
        footer: Text(
          "Terima Kasih telah memilih layanan kami. Enjoy the Features!",
          style: GoogleFonts.signika(
            textStyle: const TextStyle(
              color: Color(0xff01b399),
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: IntroductionScreen(
            globalBackgroundColor: Colors.white,
            pages: listPagesViewModel,
            showBackButton: true,
            back: const Icon(Icons.arrow_back),
            next: const Icon(Icons.arrow_forward),
            done: const Text(
              "Done",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            onDone: () {
              Navigator.pushReplacementNamed(context, Login.routeName);
            },
            baseBtnStyle: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
