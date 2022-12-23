import 'package:e_kost/models/kamar_model.dart';
import 'package:e_kost/models/kost_model.dart';
import 'package:e_kost/pages/favorite.dart';
import 'package:e_kost/pages/index.dart';
import 'package:e_kost/pages/kost/kost.dart';
import 'package:e_kost/pages/kost/kost_index.dart';
import 'package:e_kost/pages/profile.dart';
import 'package:e_kost/pages/voucher.dart';
import 'package:e_kost/providers/kamar_provider.dart';
import 'package:e_kost/providers/kost_provider.dart';
import 'package:e_kost/providers/transaction_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      final transactionProvider = Provider.of<TransactionProvider>(context);
      transactionProvider.clearTransaction();
      transactionProvider.initDataTransaction().then((value) => isInit = false);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.byLogin();

    final transaction =
        Provider.of<TransactionProvider>(context).byIdUser(user.id);

    final allKost = Provider.of<KostProvider>(context).allkost;

    List<KostModel> favoriteKost = [];
    allKost.forEach((kost) {
      favoriteKost.add(kost);
    });
    favoriteKost.sort((a, b) => b.favorite.compareTo(a.favorite));

    List<KamarModel> kamar = [];
    if (transaction.isNotEmpty) {
      kamar = Provider.of<KamarProvider>(context)
          .byIdUser(transaction.first.idUser);
    }

    List<KostModel> kost = [];
    if (transaction.isNotEmpty) {
      kost = Provider.of<KostProvider>(context)
          .byTransaction(transaction.first.idKost);
    }

    if (isInit) {
      return Scaffold(
        body: Center(
          child: Lottie.asset(
            'lotties/loading.json',
            width: 100,
            height: 100,
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            user.nama,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Profile.routeName);
                },
                icon: const Icon(
                  Icons.account_circle,
                  size: 40,
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Kost Anda",
                              style: TextStyle(
                                color: Color.fromARGB(255, 58, 58, 58),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              (transaction.isNotEmpty) ? kost.first.nama : "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 58, 58, 58),
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              (transaction.isNotEmpty) ? kost.first.alamat : "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 58, 58, 58),
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                          color: Color.fromARGB(255, 58, 58, 58)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Kamar Anda",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 58, 58, 58),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              (transaction.isNotEmpty &&
                                      kamar.first.idUser.isNotEmpty)
                                  ? "No ${kamar.first.no}"
                                  : "",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 58, 58, 58),
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              (transaction.isNotEmpty &&
                                      kamar.first.idUser.isNotEmpty)
                                  ? "Rp ${kamar.first.harga}"
                                  : "",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 58, 58, 58),
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                          color: Color.fromARGB(255, 58, 58, 58)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Tanggal",
                              style: TextStyle(
                                color: Color.fromARGB(255, 58, 58, 58),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              (transaction.isNotEmpty)
                                  ? DateFormat.yMMMEd()
                                      .format(DateTime.parse(
                                          transaction.first.dateIn))
                                      .toString()
                                  : "",
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              (transaction.isNotEmpty)
                                  ? DateFormat.yMMMEd()
                                      .format(DateTime.parse(
                                          transaction.first.dateOut))
                                      .toString()
                                  : "",
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          shadowColor: Colors.white,
        ),
        body: SafeArea(
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, bottom: 20),
                      child: const Text(
                        "Layanan",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      // color: Colors.grey,
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(Kost.routeName);
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/icon1.png',
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Kost",
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Voucher.routeName);
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/icon2.png',
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Voucher",
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Favorite.routeName);
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/icon3.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Favorite",
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  Index.routeName,
                                );
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/icon4.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Kelola Kost",
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 40, left: 20, bottom: 10),
                      child: const Text(
                        "Best for You",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SizedBox(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                (favoriteKost.length > 5)
                                    ? 5
                                    : favoriteKost.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      KostIndex.routeName,
                                      arguments:
                                          favoriteKost.elementAt(index).id);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 10, bottom: 10),
                                  child: Container(
                                    width: 300,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.5), //color of shadow
                                          spreadRadius: 1, //spread radius
                                          blurRadius: 3, // blur radius
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 200,
                                          // color: Colors.amber,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 12,
                                              left: 12,
                                              right: 12,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  favoriteKost
                                                      .elementAt(index)
                                                      .nama,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.purple,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                Text(
                                                  userProvider
                                                      .byId(favoriteKost
                                                          .elementAt(index)
                                                          .idUser)
                                                      .nama,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(height: 3),
                                                Text(
                                                  favoriteKost
                                                      .elementAt(index)
                                                      .alamat,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Added to Favorite : ",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.signika(
                                                        textStyle:
                                                            const TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.pink,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    const Icon(
                                                      Icons.favorite,
                                                      color: Colors.pink,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      favoriteKost
                                                          .elementAt(index)
                                                          .favorite
                                                          .toString(),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.pink,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            child: Image.asset(
                                              'images/card1.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
