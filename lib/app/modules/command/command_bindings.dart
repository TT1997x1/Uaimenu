import 'package:get/get.dart';
import './command_controller.dart';

class CommandBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(CommandController());
    }
}