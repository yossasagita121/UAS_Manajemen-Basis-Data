import 'package:e_kost/pages/penghuni/penghuni_index.dart';
import 'package:e_kost/providers/kamar_provider.dart';
import 'package:e_kost/providers/kost_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Penghuni extends StatelessWidget {
  const Penghuni({super.key});
  static const routeName = '/penghuni';

  @override
  Widget build(BuildContext context) {
    final idKost = ModalRoute.of(context)!.settings.arguments as String;
    final kost = Provider.of<KostProvider>(context).byId(idKost);
    final kamar = Provider.of<KamarProvider>(context).byNotAvailable(idKost);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Penghuni ${kost.nama}")),
      body: ListView.builder(
        itemCount: kamar.length,
        itemBuilder: (context, index) => ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          title: Text(
            userProvider.byId(kamar.elementAt(index).idUser).nama,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            userProvider.byId(kamar.elementAt(index).idUser).email,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            "Kamar ${kamar.elementAt(index).no}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(PenghuniIndex.routeName);
          },
        ),
      ),
    );
  }
}
