import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './mesa_controller.dart';

class MesaPage extends GetView<MesaController> {
    
    const MesaPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('MesaPage'),),
            body: Container(),
        );
    }
}