import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class UaimenuState<S extends StatefulWidget, C extends GetxController>
    extends State<S> {
  C get Controller => Get.find();
}
