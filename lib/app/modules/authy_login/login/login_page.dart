import 'package:application_uaimenu/app/core/ui/uaimenu_state.dart';
import 'package:application_uaimenu/app/core/ui/uaimenu_ui.dart';
import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_appbar.dart';
import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_button.dart';
import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_textformsfild.dart';
import 'package:application_uaimenu/app/modules/authy_login/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends UaimenuState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UaimenuAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: context.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColorDark),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        UaimenuTextformfield(
                            label: 'E-mail',
                            controller: _emailEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('E-mail obrigat??ria'),
                              Validatorless.required('E-mail inv??lido')
                            ])),
                        const SizedBox(
                          height: 30,
                        ),
                        UaimenuTextformfield(
                            label: 'Senha',
                            controller: _passwordEC,
                            obscureText: true,
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha obrigat??ria'),
                              Validatorless.min(6,
                                  'Senha deve conter pelo menos 6 caracteres')
                            ])),
                        const SizedBox(
                          height: 70,
                        ),
                        Center(
                            child: UaimenuButton(
                                label: 'Entrar',
                                onPressed: () {
                                  final formValid =
                                      _formKey.currentState?.validate() ??
                                          false;
                                  if (formValid) {
                                    controller.login(
                                      email: _emailEC.text,
                                      password: _passwordEC.text,
                                    );
                                  }
                                })),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('N??o possui cadastro ?'),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/auth/register');
                              },
                              child: const Text(
                                'Cadastre-se',
                                style: UaimenuUi.textBold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
