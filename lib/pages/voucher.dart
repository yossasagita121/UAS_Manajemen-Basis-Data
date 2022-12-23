import 'package:flutter/material.dart';

class Voucher extends StatelessWidget {
  const Voucher({super.key});
  static const routeName = '/voucher';

  @override
  Widget build(BuildContext context) {
    List<Tab> MyTabs = const [
      Tab(
        child: Text(
          "VOUCHER",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Tab(
        child: Text(
          "MY VOUCHER",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ];

    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: MyTabs.length,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: const Text("Voucher"),
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: const Color(0xdddddddd),
              tabs: MyTabs,
            ),
          ),
          body: TabBarView(
            children: [
              CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: List.generate(10, (index) {
                        return Container(
                          width: double.infinity,
                          height: 140,
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), //color of shadow
                                spreadRadius: 1, //spread radius
                                blurRadius: 3, // blur radius
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: double.infinity,
                                width: 80,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 207, 42, 42),
                                ),
                                child: Center(
                                  child: Text(
                                    "${index + 1}0%",
                                    style: const TextStyle(
                                      fontSize: 27,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Diskon ${index + 1}0% disemua kost",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 87, 87, 87),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        "Berlaku hingga 30 Dec 2022",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromARGB(255, 87, 87, 87),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        width: 70,
                                        height: 25,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 231, 158, 47),
                                          ),
                                          child: const Text(
                                            "Klaim",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, right: 2),
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/card2.png',
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: List.generate(3, (index) {
                        return Container(
                          width: double.infinity,
                          height: 140,
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), //color of shadow
                                spreadRadius: 1, //spread radius
                                blurRadius: 3, // blur radius
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: double.infinity,
                                width: 80,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 207, 42, 42),
                                ),
                                child: Center(
                                  child: Text(
                                    "${index + 1}0%",
                                    style: const TextStyle(
                                      fontSize: 27,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Diskon ${index + 1}0% disemua kost",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 87, 87, 87),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        "Berlaku hingga 30 Dec 2022",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromARGB(255, 87, 87, 87),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        width: 70,
                                        height: 25,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 231, 158, 47),
                                          ),
                                          child: const Text(
                                            "Klaim",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, right: 2),
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/card2.png',
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
