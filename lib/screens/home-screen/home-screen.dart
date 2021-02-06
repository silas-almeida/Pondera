import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pondera/models/providers/user-provider.dart';
import 'package:pondera/screens/home-screen/components/todo-card.dart';
import 'package:pondera/screens/my-elections-screen/my-elections-screen.dart';
import 'package:pondera/utils/colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = context.watch<UserProvider>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(color: CustomColors.customBlueGrey),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    'Pondera',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  centerTitle: true,
                ),
                actions: [
                  TextButton.icon(
                      onPressed: () {
                        context.read<UserProvider>().signOut();
                      },
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Sair',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              SliverToBoxAdapter(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: (size.height - (size.height * 0.1)),
                      color: Colors.white,
                    ),
                    Positioned(
                      top: 0,
                      child: Card(
                        elevation: 4.0,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                          child: Container(
                            color: CustomColors.customBlueGrey,
                            height: size.height * 0.35,
                            width: size.width,
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * 0.15,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 50,
                                    child: Center(
                                      child: Text(
                                        userProvider.user.getInitials(),
                                        style: TextStyle(
                                            color: CustomColors.customBlueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    'Olá, ${userProvider.user.name}!',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.26,
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.32,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => MyElectionsScreen(),
                                    ),
                                  ),
                                  child: Hero(
                                    tag: 'todoCard',
                                    child: ToDoCard(
                                      text: 'Minhas Enquetes',
                                      imagePath:
                                          'assets/images/undraw_election_day_w842.svg',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ToDoCard(
                                    text: 'Meus Votos',
                                    imagePath:
                                        'assets/images/undraw_Finance_re_gnv2.svg'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      child: Material(
                        color: Colors.transparent,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.arrow_upward,
                                  size: 26,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Participe de uma nova enquete!',
                                  style: TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
