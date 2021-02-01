import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pondera/screens/home-screen/components/todo-card.dart';
import 'package:pondera/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
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
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.15,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: Center(
                            child: Text(
                              'SA',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 32),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Olá, Silas Almeida!',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                    height: size.height * 0.32,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ToDoCard(text: 'Minhas Enquetes', imagePath: 'assets/images/undraw_election_day_w842.svg'),
                        const SizedBox(
                          width: 10,
                        ),
                        ToDoCard(text: 'Meus Votos', imagePath: 'assets/images/undraw_Finance_re_gnv2.svg'),
                      ],
                    ),
                    // child: ListView.separated(
                    //   padding: EdgeInsets.symmetric(horizontal: 20),
                    //   itemCount: 2,
                    //   itemBuilder: (ctx, index) {
                    //     return ToDoCard('Minhas Enquetes');
                    //   },
                    //   separatorBuilder: (ctx, index) {
                    //     return SizedBox(
                    //       width: size.width * 0.03,
                    //     );
                    //   },
                    //   scrollDirection: Axis.horizontal,
                    // ),
                  ),
                  SizedBox(
                    height: size.height * 0.18,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              size: 26,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Participe de uma nova enquete!',
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
