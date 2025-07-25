import 'package:filters/constants/text.dart';
import 'package:flutter/material.dart';

class PricePerNight extends StatelessWidget {
  const PricePerNight({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Text('Цена (за ночь)', style: MyTextStyles.poppins16W600),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
