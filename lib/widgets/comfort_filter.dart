import 'package:filters/constants/text.dart';
import 'package:flutter/material.dart';

class AmenitiesFilter extends StatefulWidget {
  const AmenitiesFilter({super.key});

  @override
  State<AmenitiesFilter> createState() => _AmenitiesFilterState();
}

class _AmenitiesFilterState extends State<AmenitiesFilter> {
  final Map<String, bool> amenities = {
    'Завтрак включен': false,
    'Бассейн': false,
    'Wi-Fi': false,
    'Парковка': false,
    'С животными': false,
    'Бесплатная отмена': false,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Удобства', style: MyTextStyles.poppins16W600),
          const SizedBox(height: 12),
          Wrap(
            spacing: 40,
            // runSpacing: 8,
            children: amenities.entries.map((entry) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 40,
                child: Row(
                  children: [
                    Checkbox(
                      value: entry.value,
                      onChanged: (val) {
                        setState(() {
                          amenities[entry.key] = val!;
                        });
                      },
                      activeColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Flexible(child: Text(entry.key)),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
