import 'dart:developer';
import 'package:application_uaimenu/app/core/constants/constants.dart';
import 'package:application_uaimenu/app/core/mixins/loader_mixins.dart';
import 'package:application_uaimenu/app/core/mixins/messagen_mixins.dart';
import 'package:application_uaimenu/app/core/restClient/rest_client.dart';
import 'package:application_uaimenu/app/repositores/auth_repository_implements.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();
      final userLogged = await _authRepository.register(name, email, password);
      _loading.toggle();
      GetStorage().write(Constants.USER_KEY, userLogged.id);
      //Get.back();
      /*_loading.toggle();
   _message(MessageModel(title: 'Sucesso',
    message: 'Cadastro realizado com sucesso', 
    type: MessageType.info,
    ));*/
    } on RestClientExcption catch (e, s) {
      _loading.toggle();
      log('Erro ao registrar usuario', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: e.message,
        type: MessageType.error,
      ));
    } catch (e, s) {
      _loading.toggle();
      log('Error ao registar usuario', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao registar usuario',
          type: MessageType.error,
        ),
      );
    }
  }
}
