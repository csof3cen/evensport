import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';

class RuningAtrribute extends StatelessWidget {
  const RuningAtrribute({
    this.bgColor,
    this.labelColor,
    this.subLabel,
    required this.label,
    required this.icon,
    this.flex = 1,
    Key? key,
  }) : super(key: key);

  final String label;
  final String? subLabel;
  final Widget icon;
  final int flex;
  final Color? bgColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        color: bgColor != null ? bgColor!.withOpacity(0.05) : kBgColor,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: kPadding / 2),
          child: Column(
            children: [
              icon,
              const SizedBox(height: 5),
              Text(
                label,
                style: TextStyle(
                  color: labelColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subLabel ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
