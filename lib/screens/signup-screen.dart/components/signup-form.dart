import 'package:flutter/material.dart';
import 'package:pondera/models/classes/user.dart';
import 'package:pondera/models/providers/user-provider.dart';
import 'package:pondera/utils/colors.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
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
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                      ),
                      onSaved: (email) {
                        user.email = email;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome',
                      ),
                      onSaved: (name) {
                        user.name = name;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Senha'),
                      onSaved: (password) {
                        user.password = password;
                      },
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Confirme a senha'),
                      onSaved: (confirmPassword) {
                        user.confirmPassword = confirmPassword;
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
                                if (user.password != user.confirmPassword) {
                                  ScaffoldMessengerState().showSnackBar(
                                    const SnackBar(
                                      content: Text('Senhas não coincidem'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }
                                print(user.email);
                                print(user.password);
                                userProvider.signUp(
                                    user: user,
                                    onSuccess: () {
                                      Navigator.of(context).pop();
                                    },
                                    onFail: (error) {
                                      ScaffoldMessengerState().showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Falha ao cadastrar: $error'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
                              }
                            },
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
                        primary: CustomColors.customBlueGrey.withOpacity(0.8),
                      ),
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
