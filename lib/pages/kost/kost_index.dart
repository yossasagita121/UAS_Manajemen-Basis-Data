import 'package:e_kost/pages/kamar/kamar.dart';
import 'package:e_kost/providers/favorite_provider.dart';
import 'package:e_kost/providers/kost_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class KostIndex extends StatelessWidget {
  static const routeName = '/kostIndex';

  @override
  Widget build(BuildContext context) {
    final idKost = ModalRoute.of(context)!.settings.arguments as String;
    final kostProvider = Provider.of<KostProvider>(context);

    final kost = kostProvider.byId(idKost);
    final idUser = Provider.of<UserProvider>(context).byLogin().id;

    final pemilik = Provider.of<UserProvider>(context).byId(kost.idUser);

    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favorite = favoriteProvider.favorite(idKost, idUser);

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => FavoriteProvider(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.black,
              child: Stack(
                children: [
                  PageView.builder(
                      itemCount: 3,
                      pageSnapping: true,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            'images/kost${index + 1}.jpg',
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                  SafeArea(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(100, 82, 82, 82),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              // height: 150,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kost.nama,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          kost.alamat,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "No Rumah : ${kost.no}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Pemilik : ${pemilik.nama}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          pemilik.email,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Berdiri sejak : ${DateFormat.yMMMEd().format(
                            DateTime.parse(kost.createdAt),
                          )}",
                          style: const TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.pin_drop_outlined,
                          size: 40,
                          color: Color.fromARGB(255, 53, 53, 53),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Deskripsi",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      kost.deskripsi,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //color of shadow
              spreadRadius: 1, //spread radius
              blurRadius: 3, // blur radius
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 90,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    (favorite.isNotEmpty)
                        ? favoriteProvider
                            .deleteFavorite(favoriteProvider
                                .favorite(idKost, idUser)
                                .first
                                .id)
                            .then((value) {
                            kostProvider.editFavorite(
                                idKost, kost.favorite - 1);
                          })
                        : favoriteProvider
                            .addFavorite(idKost, idUser)
                            .then((value) {
                            kostProvider.editFavorite(
                                idKost, kost.favorite + 1);
                          });
                  },
                  icon: Icon(
                    (favorite.isNotEmpty)
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: Colors.pink,
                    size: 30,
                  ),
                ),
              ),
            ),
            const VerticalDivider(color: Color.fromARGB(255, 122, 122, 122)),
            Container(
              width: 90,
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.whatsapp,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Kamar.routeName,
                    arguments: kost.id,
                  );
                },
                child: Container(
                  height: double.infinity,
                  color: Colors.teal,
                  child: const Center(
                    child: Text(
                      "Pesan Kamar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
