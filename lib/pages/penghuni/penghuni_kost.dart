import 'package:e_kost/pages/kost/kost_index.dart';
import 'package:e_kost/pages/penghuni/penghuni.dart';
import 'package:e_kost/providers/kost_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PenghuniKost extends StatefulWidget {
  static const routeName = '/penghuniKost';

  @override
  State<PenghuniKost> createState() => _PenghuniKost();
}

class _PenghuniKost extends State<PenghuniKost> {
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
    final user = Provider.of<UserProvider>(context).byLogin();

    final kostProvider = Provider.of<KostProvider>(context);
    final kost = kostProvider.kostByLogin(user.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Kost"),
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
                itemCount: kost.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 62, 145, 65),
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      kost[index].nama,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      kost[index].alamat,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        Penghuni.routeName,
                        arguments: kost[index].id,
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
