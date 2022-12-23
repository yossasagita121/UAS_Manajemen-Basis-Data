// import 'package:e_kost/pages/kost/kost.dart';
import 'package:e_kost/pages/kost/kost_add.dart';
import 'package:e_kost/pages/kost/kost_manage.dart';
import 'package:e_kost/pages/laporan/laporan_kost.dart';
import 'package:e_kost/pages/penghuni/penghuni_kost.dart';
import 'package:e_kost/providers/kost_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DashboardItems extends StatefulWidget {
  const DashboardItems(idUser);

  @override
  State<DashboardItems> createState() => _DashboardItemsState();
}

class _DashboardItemsState extends State<DashboardItems> {
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
    final jumlah = kostProvider.kostByLogin(idUser).length;

    return ChangeNotifierProvider(
      create: (context) => KostProvider(),
      child: (isInit)
          ? Center(
              child: Lottie.asset(
                'lotties/loading2.json',
                width: 80,
                height: 80,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(KostManage.routeName);
                    },
                    child: Container(
                      height: 70,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.home,
                                  size: 20,
                                ),
                                Text(
                                  "Kost Anda",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              ],
                            ),
                            Text(
                              jumlah.toString(),
                              style:
                                  TextStyle(color: Colors.green, fontSize: 18),
                            ),
                            const Text(
                              "Tap for Detail",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(KostAdd.routeName);
                            },
                            icon: const Icon(
                              Icons.add_box_rounded,
                              size: 30,
                              color: Colors.white,
                            )),
                        const Text("Tambah"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(PenghuniKost.routeName);
                            },
                            icon: const Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.white,
                            )),
                        const Text("Penghuni"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(LaporanKost.routeName);
                            },
                            icon: const Icon(
                              Icons.pageview_rounded,
                              size: 30,
                              color: Colors.white,
                            )),
                        const Text("Laporan"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
