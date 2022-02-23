import 'package:application_uaimenu/app/core/ui/uaimenu_ui.dart';
import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_appbar.dart';
import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_button.dart';
import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_textformsfild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                      const UaimenuTextformfield(label: 'E-mail'),
                      const SizedBox(
                        height: 30,
                      ),
                      const UaimenuTextformfield(label: 'Senha'),
                      const SizedBox(
                        height: 70,
                      ),
                      Center(
                          child:
                              UaimenuButton(label: 'Entrar', onPressed: () {})),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Não possui cadastro ?'),
                          TextButton(
                            onPressed: () {
                              Get.toNamed ('/auth/register');
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
