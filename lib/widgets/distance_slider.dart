import 'package:filters/constants/text.dart';
import 'package:flutter/material.dart';

class DistanceSlider extends StatefulWidget {
  const DistanceSlider({super.key});

  @override
  State<DistanceSlider> createState() => _DistanceSliderState();
}

class _DistanceSliderState extends State<DistanceSlider> {
  double _currentDistance = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Text(
            'Расстояние от центра',
            style: MyTextStyles.poppins16W600,
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Text(
            '${_currentDistance.round()} км',
            style: MyTextStyles.poppins16W400,
          ),
        ),
        Slider(
          autofocus: false,
          activeColor: Colors.blue,
          value: _currentDistance,
          min: 0,
          max: 10,
          divisions: 10,
          label: '${_currentDistance.round()} км',
          onChanged: (value) {
            setState(() {
              _currentDistance = value;
            });
          },
        ),
      ],
    );
  }
}
