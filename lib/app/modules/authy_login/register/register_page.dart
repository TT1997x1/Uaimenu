import 'package:application_uaimenu/app/core/ui/uaimenu_state.dart';
import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_Appbar.dart';
import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_button.dart';
import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_textformsfild.dart';
import 'package:application_uaimenu/app/modules/authy_login/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends UaimenuState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
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
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark),
                  ),
                  Text(
                    'Preencha os campos a baixo para realizar o cadastro',
                    style: context.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  UaimenuTextformfield(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.required(' Nome obrigatório'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  UaimenuTextformfield(
                    label: 'E-mail',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatório'),
                      Validatorless.email('E-mail inválido')
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  UaimenuTextformfield(
                    label: 'Senha',
                    controller: _passwordEC,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatória'),
                      Validatorless.min(
                          6, 'Senha deve conter pelo menos 6 caracteres')
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  UaimenuTextformfield(
                    label: 'Confirma a senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirme senha obrigatória'),
                      Validatorless.compare(
                          _passwordEC, 'Senha diferente de confirma a senha'),
                    ]),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: UaimenuButton(
                          label: 'Cadastrar',
                          onPressed: () {
                            final formValid =
                                _formKey.currentState?.validate() ?? false;
                            if (formValid) {
                              controller.register(
                                name: _nameEC.text,
                                email: _emailEC.text,
                                password: _passwordEC.text,
                              );
                            }
                            //Get.find<RegisterController>().qualquer();
                          })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
