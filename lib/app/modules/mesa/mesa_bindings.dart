import 'package:get/get.dart';
import './mesa_controller.dart';

class MesaBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(MesaController());
    }
}