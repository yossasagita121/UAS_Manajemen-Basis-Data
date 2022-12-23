// import 'package:e_kost/pages/kost/kost_edit.dart';
import 'package:e_kost/pages/kost/kost_index.dart';
import 'package:e_kost/providers/kost_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Kost extends StatefulWidget {
  static const routeName = '/kost';

  @override
  State<Kost> createState() => _KostState();
}

class _KostState extends State<Kost> {
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
    final kostProvider = Provider.of<KostProvider>(context);
    final kost = kostProvider.allkost;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rumah Kost"),
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
                        KostIndex.routeName,
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
