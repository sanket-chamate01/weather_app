import 'package:flutter/material.dart';

class AdditionalInfor extends StatelessWidget {
  final IconData weatherIcon;
  final String iconName, iconValue;
  const AdditionalInfor({
    super.key,
    required this.weatherIcon,
    required this.iconName,
    required this.iconValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          weatherIcon,
          size: 32,
        ),
        const SizedBox(height: 8),
        Text(iconName),
        const SizedBox(height: 8),
        Text(
          iconValue,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
