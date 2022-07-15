import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_appbar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CommandPage extends StatelessWidget {
  const CommandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: UaimenuAppbar(),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: context.widthTransformer(reducedBy: 60),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.menu_rounded),
                      label: const Text('Mesa'),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
