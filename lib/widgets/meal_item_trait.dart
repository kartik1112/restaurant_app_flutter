import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.dataText, required this.dataIcon});

  final String dataText;
  final IconData dataIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(dataIcon),
        Text(
          dataText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ],
    );
  }
}
