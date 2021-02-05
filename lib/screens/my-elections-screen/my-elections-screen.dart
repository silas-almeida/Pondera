import 'package:flutter/material.dart';
import 'package:pondera/utils/colors.dart';

class MyElectionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBarKey = GlobalKey();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: CustomColors.customOrange,
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                key: appBarKey,
                floating: true,
                snap: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    'Minhas Enquetes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  centerTitle: true,
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: mediaQuery.size.height,
                        color: Colors.white,
                      ),
                      Card(
                        margin: EdgeInsets.zero,
                        elevation: 4.0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 18),
                          color: CustomColors.customOrange,
                          height: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Enquetes abertas',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18),
                                  ),
                                  Text('2',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Divider(
                                color: Colors.white,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Enquetes fechadas',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Divider(
                                color: Colors.white,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    '4',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Divider(
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        child: Container(
                          width: mediaQuery.size.width - 36,
                          height: mediaQuery.size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                elevation: 4.0,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Container(
                                  height: 100,
                                  child: Text('opa'),
                                  color: Colors.white,
                                ),
                              ),
                              Card(
                                elevation: 4.0,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Container(
                                  height: 100,
                                  child: Text('opa'),
                                  color: Colors.white,
                                ),
                              ),
                              Card(
                                elevation: 4.0,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Container(
                                  height: 100,
                                  child: Text('opa'),
                                  color: Colors.white,
                                ),
                              ),
                              Card(
                                elevation: 4.0,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Container(
                                  height: 100,
                                  child: Text('opa'),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
