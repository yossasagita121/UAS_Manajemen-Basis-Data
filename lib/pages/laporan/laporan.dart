import 'package:e_kost/pages/laporan/laporan_index.dart';
import 'package:e_kost/providers/kamar_provider.dart';
import 'package:e_kost/providers/kost_provider.dart';
import 'package:e_kost/providers/transaction_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Laporan extends StatefulWidget {
  static const routeName = '/laporan';

  @override
  State<Laporan> createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
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
    final idKost = ModalRoute.of(context)!.settings.arguments as String;

    final kostProvider = Provider.of<KostProvider>(context);
    final kost = kostProvider.byId(idKost);

    final userProvider = Provider.of<UserProvider>(context);
    final kamarProvier = Provider.of<KamarProvider>(context);

    final transaction =
        Provider.of<TransactionProvider>(context).byIdKost(idKost);

    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan ${kost.nama}"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => TransactionProvider(),
        child: (isInit)
            ? Center(
                child: Lottie.asset(
                  'lotties/loading.json',
                  width: 100,
                  height: 100,
                ),
              )
            : ListView.builder(
                itemCount: transaction.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      userProvider
                          .byId(transaction.elementAt(index).idUser)
                          .nama,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      "Kamar ${kamarProvier.byId(transaction.elementAt(index).idKamar).no}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                      DateFormat.yMMMEd().format(DateTime.parse(
                          transaction.elementAt(index).createdAt)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        LaporanIndex.routeName,
                        arguments: transaction.elementAt(index).id,
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
