import 'package:application_uaimenu/app/core/ui/widgets/formatter.dart';
import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_buton_stl.dart';
import 'package:flutter/material.dart';

class PlusMinusBox extends StatelessWidget {
  final bool elevated;
  final Color? backgroundColor;
  final String? label;
  final int quantity;
  final double price;
  final VoidCallback minusCallback;
  final VoidCallback plusCallback;
  final bool calculateTotal;

  const PlusMinusBox({
    Key? key,
    this.elevated = false,
    this.backgroundColor,
    this.label,
    required this.quantity,
    required this.price,
    required this.minusCallback,
    required this.plusCallback,
    this.calculateTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevated ? 5 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: label != null,
                child: Text(
                  label ?? '',
                  style: const TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  UaimenuButonStl(
                    onPressed: minusCallback,
                    label: '-',
                  ),
                  Text('$quantity'),
                  UaimenuButonStl(
                    onPressed: plusCallback,
                    label: '+',
                  )
                ],
              ),
              Visibility(visible: label == null, child: const Spacer()),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 10),
                constraints: const BoxConstraints(maxWidth: 70),
                child: Text(FormatterHelper.formatCurrency(
                    calculateTotal ? price * quantity : price)),
              ),
            ]),
      ),
    );
  }
}
