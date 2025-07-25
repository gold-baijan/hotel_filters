import 'package:filters/constants/text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PriceRangeFilter extends StatefulWidget {
  const PriceRangeFilter({super.key, required this.data});
  final List<double> data;

  @override
  State<PriceRangeFilter> createState() => _PriceRangeFilterState();
}

class _PriceRangeFilterState extends State<PriceRangeFilter> {
  RangeValues _currentRange = const RangeValues(0, 300);

  List<BarChartGroupData> _buildBars() {
    return widget.data.asMap().entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: entry.value,
            width: 6.5,
            borderRadius: BorderRadius.circular(0),
            color: Colors.grey[300],
          ),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final minPrice = _currentRange.start.round();
    final maxPrice = _currentRange.end.round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'US\$${minPrice.round()} - US\$${maxPrice.round()}+',
            style: MyTextStyles.poppins16W400,
          ),
        ),
        SizedBox(
          height: 150,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: BarChart(
                  BarChartData(
                    barGroups: _buildBars(),
                    alignment: BarChartAlignment.spaceBetween,
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
              Positioned(
                bottom: -2,
                left: 0,
                right: 0,
                child: RangeSlider(
                  min: 0,
                  max: 300,
                  divisions: 300,
                  values: _currentRange,
                  activeColor: Colors.blue,
                  onChanged: (RangeValues newRange) {
                    setState(() => _currentRange = newRange);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

