import 'package:application_uaimenu/app/core/ui/uaimenu_ui.dart';
import 'package:flutter/material.dart';

class IconBadge extends StatelessWidget {
  const IconBadge({Key? key, required this.number, required this.icon})
      : super(key: key);

  final int number;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(icon),
        Visibility(
          visible: number > 0,
          child: Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              maxRadius: 9,
              backgroundColor: Colors.red,
              child: Text(
                number.toString(),
                style: UaimenuUi.textBold.copyWith(fontSize: 9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
