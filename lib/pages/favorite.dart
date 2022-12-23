import 'package:e_kost/pages/kost/kost_index.dart';
import 'package:e_kost/providers/favorite_provider.dart';
import 'package:e_kost/providers/kost_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});
  static const routeName = '/favorite';

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      final kostProvider = Provider.of<KostProvider>(context);
      kostProvider.clearKost();
      kostProvider.initDataKost().then((value) => isInit = false);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final idUser = Provider.of<UserProvider>(context).byLogin().id;

    final favoriteUser =
        Provider.of<FavoriteProvider>(context).favoriteUser(idUser);

    final kostProvider = Provider.of<KostProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Favorite Kost"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => KostProvider(),
        child: (isInit)
            ? Center(
                child: Lottie.asset(
                  'lotties/loading.json',
                  width: 100,
                  height: 100,
                ),
              )
            : ListView.builder(
                itemCount: favoriteUser.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        size: 35,
                        color: Colors.pink,
                      ),
                    ),
                    title: Text(
                      kostProvider
                          .byId(favoriteUser.elementAt(index).idKost)
                          .nama,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      kostProvider
                          .byId(favoriteUser.elementAt(index).idKost)
                          .alamat,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        KostIndex.routeName,
                        arguments: kostProvider
                            .byId(favoriteUser.elementAt(index).idKost)
                            .id,
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
