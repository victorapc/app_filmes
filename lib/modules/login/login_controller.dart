import 'package:app_filmes/application/ui/loader/loader_mixin.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      //loading.value = true;
      loading(true); // Isso é igual a linha de cima por causa do .obs
      await _loginService.login();
      //await 2.seconds.delay(); // Recurso da lib Get.
      // await Future.delayed(Duration(seconds: 2)); Isso é igual a linha de cima.
      loading(false); // Isso é igual a linha de cima por causa do .obs
      message(
          MessageModel.info(title: 'Sucesso', message: 'Login realizado com sucesso.'));
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(title: 'Login Erro', message: 'Erro ao realizar login.'));
    }
  }
}
