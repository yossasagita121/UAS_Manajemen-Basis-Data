import 'package:e_kost/pages/kost/kost_edit.dart';
import 'package:e_kost/pages/kost/kost_index_manage.dart';
import 'package:e_kost/providers/kost_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class KostManage extends StatefulWidget {
  static const routeName = '/kostManage';

  @override
  State<KostManage> createState() => _KostManageState();
}

class _KostManageState extends State<KostManage> {
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
    final kostProvider = Provider.of<KostProvider>(context);
    final kost = kostProvider.kostByLogin(idUser);

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
                    trailing: Wrap(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              KostEdit.routeName,
                              arguments: kost[index].id,
                            );
                          },
                          icon: const Icon(
                            Icons.edit_note_rounded,
                            color: Color.fromARGB(255, 211, 193, 36),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            kostProvider.deleteKost(kost[index].id).then(
                              (value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Data berhasil dihapus!"),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 192, 38, 26),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        KostIndexManage.routeName,
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
