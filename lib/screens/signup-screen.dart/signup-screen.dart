import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pondera/utils/colors.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                CustomColors.customOrange,
                CustomColors.customPink,
              ])),
        ),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Cadastro',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                centerTitle: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: size.height * 0.8,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Form(
                      child: SingleChildScrollView(
                        child: Card(
                          margin: EdgeInsets.all(20),
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'E-mail'),
                                ),
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'Senha'),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Confirme a senha'),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Cadastrar',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: CustomColors.customBlueGrey
                                        .withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.091,
                      right: size.width * 0.066,
                      child: SvgPicture.asset(
                        'assets/images/freelancer.svg',
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
