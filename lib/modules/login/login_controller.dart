import 'package:app_filmes/application/ui/loader/loader_mixin.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    //loading.value = true;
    loading(true);  // Isso é igual a linha de cima por causa do .obs

    await 2.seconds.delay();  // Recurso da lib Get.
    // await Future.delayed(Duration(seconds: 2)); Isso é igual a linha de cima.

    //loading.value = false;
    loading(false); // Isso é igual a linha de cima por causa do .obs

    message(MessageModel.error(title: 'Titulo Error', message: 'Mensagem Error'));
    await 1.seconds.delay();  // Recurso da lib Get.
    message(MessageModel.info(title: 'Titulo Info', message: 'Mensagem Info'));
  }
}