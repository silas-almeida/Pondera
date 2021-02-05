import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:pondera/models/classes/user.dart';
import 'package:pondera/models/providers/user-provider.dart';
import 'package:pondera/screens/home-screen/home-screen.dart';
import 'package:pondera/screens/initial-screen/isLogged.dart';
import 'package:pondera/utils/colors.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key key,
    @required this.formKey,
    @required this.user,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final PonderaUser user;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Consumer<UserProvider>(
        builder: (_, userProvider, __) {
          return SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      enabled: !userProvider.loading,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                      ),
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      onSaved: (email) {
                        user.email = email;
                      },
                    ),
                    TextFormField(
                      enabled: !userProvider.loading,
                      decoration: InputDecoration(labelText: 'Senha'),
                      obscureText: true,
                      onSaved: (password) {
                        user.password = password;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      onPressed: userProvider.loading
                          ? null
                          : () {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();
                                print(user.email);
                                print(user.password);
                                userProvider.signIn(
                                    user: user,
                                    onSuccess: () {
                                      Navigator.of(context).pop();
                                    },
                                    onFail: (error) {
                                      ScaffoldMessengerState().showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Falha ao logar: $error'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
                              }
                            },
                      child: userProvider.loading
                          ? Transform.scale(
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                              ),
                              scale: 0.7,
                            )
                          : Text(
                              'Logar',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                      style: ButtonStyle(backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(MaterialState.disabled)) {
                            return CustomColors.customBlueGrey.withOpacity(0.8);
                          } else {
                            return CustomColors.customBlueGrey;
                          }
                        },
                      ), textStyle:
                          MaterialStateProperty.resolveWith<TextStyle>(
                              (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.8));
                        } else {
                          return TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white);
                        }
                      })),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SignInButton(
                      Buttons.Facebook,
                      text: 'Entre com o Facebook',
                      onPressed: () {},
                    ),
                    SignInButton(
                      Buttons.Google,
                      text: 'Entre com o Google',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
