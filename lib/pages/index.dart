import 'package:e_kost/pages/profile.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/index_widgets.dart';

class Index extends StatelessWidget {
  const Index({super.key});
  static const routeName = '/index';

  @override
  Widget build(BuildContext context) {
    final idUser = Provider.of<UserProvider>(context).byLogin().id;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;

    final appBar = AppBar(
      // automaticallyImplyLeading: false,
      title: const Text("E - Kost"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(Profile.routeName, arguments: idUser);
            },
            icon: const Icon(
              Icons.account_circle,
              size: 30,
            ),
          ),
        ),
      ],
    );

    final bodyHeight = screenHeight - paddingTop - appBar.preferredSize.height;

    final isLanscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: (isLanscape) ? bodyHeight * 0.4 : bodyHeight * 0.15,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff01b399),
                  ),
                  child: DashboardItems(idUser),
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(vertical: 18),
              //   child: Text(
              //     "History",
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 20,
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              // ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(vertical: 18),
              //   child: Text(
              //     "Layanan",
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 20,
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.book),
      //       label: "History",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.logout_outlined),
      //       label: "Logout",
      //     ),
      //   ],
      // ),
    );
  }
}
