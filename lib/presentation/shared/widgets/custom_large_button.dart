import 'package:flutter/material.dart';

class CustomLargeButton extends StatelessWidget {
  final BoxDecoration? decoration;
  final String text;
  final Widget? icon;
  final MainAxisAlignment alignment;
  final Color? foreGroundColor;
  const CustomLargeButton({
    super.key,
    this.decoration,
    required this.text,
    this.icon,
    this.alignment = MainAxisAlignment.center,
    this.foreGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final radiusSize = 10.0;

    return Material(
      borderRadius: BorderRadius.circular(radiusSize),
      color: colors.primary,
      child: InkWell(
        borderRadius: BorderRadius.circular(radiusSize),
        onTap: () {},
        child: Container(
          decoration:
              decoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(radiusSize),
                color: colors.primary,
              ),
          width: double.infinity,
          height: 60,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: alignment,
              spacing: 12,
              children: [
                if (icon != null) icon!,
                Text(
                  text,
                  style: TextStyle(
                    color: foreGroundColor ??Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
