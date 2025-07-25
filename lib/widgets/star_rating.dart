import 'package:filters/constants/text.dart';
import 'package:flutter/material.dart';

enum HotelStars { notSelected, zero, one, two, three, four, five }

extension HotelStarsExtension on HotelStars {
  String get label {
    switch (this) {
      case HotelStars.notSelected:
        return 'Не выбрано';
      default:
        return (index).toString();
    }
  }

  int get stars {
    switch (this) {
      case HotelStars.zero:
        return 0;
      case HotelStars.one:
        return 1;
      case HotelStars.two:
        return 2;
      case HotelStars.three:
        return 3;
      case HotelStars.four:
        return 4;
      case HotelStars.five:
        return 5;
      default:
        return -1;
    }
  }
}

class StarRatingSelector extends StatelessWidget {
  StarRatingSelector({super.key});

  final ValueNotifier<Set<HotelStars>> _selectedStars =
      ValueNotifier<Set<HotelStars>>({HotelStars.notSelected});

  void _onTap(HotelStars value) {
    final current = _selectedStars.value.toSet();

    if (value == HotelStars.notSelected) {
      current.clear();
      current.add(HotelStars.notSelected);
    } else {
      current.remove(HotelStars.notSelected);
      if (current.contains(value)) {
        current.remove(value);
        if (current.isEmpty) {
          current.add(HotelStars.notSelected);
        }
      } else {
        current.add(value);
      }
    }

    _selectedStars.value = current;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Кол-во звезд', style: MyTextStyles.poppins16W600),
        ),
        SizedBox(
          height: 48,
          child: ValueListenableBuilder<Set<HotelStars>>(
            valueListenable: _selectedStars,
            builder: (context, selectedStars, _) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final star = HotelStars.values[index];
                  final isSelected = selectedStars.contains(star);

                  return RawChip(
                    showCheckmark: false,
                    label: star == HotelStars.notSelected
                        ? Text(star.label)
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(star.stars.toString()),
                            ],
                          ),
                    selected: isSelected,
                    selectedColor: Colors.white,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: isSelected ? Colors.blue : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    onSelected: (_) => _onTap(star),
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: HotelStars.values.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
