import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:string_capitalize/string_capitalize.dart';

class MealsListWidget extends StatelessWidget {
  const MealsListWidget(
      {super.key, required this.listData, required this.data});

  final List<String> listData;
  final String data;

  List<Widget> _buildList(BuildContext context) {
    if (data == "ingredients") {
      return List.generate(
        listData.length,
        (index) => Text(
          "${listData[index]}",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }else{
      return List.generate(
        listData.length,
        (index) => Text(
          textAlign: TextAlign.center,
          "${listData[index]} \n",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            data.capitalize(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.surfaceTint,
                ),
          ),
          const SizedBox(
            height: 12,
          ),
          ..._buildList(context)

          // ...List.generate(
          //   listData.length,
          //   (index) => Text(
          //     "${listData[index]} \n",
          //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
