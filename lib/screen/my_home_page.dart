import 'package:filters/data/hotel_price_data.dart';
import 'package:filters/widgets/comfort_filter.dart';
import 'package:filters/widgets/distance_slider.dart';
import 'package:filters/widgets/price_per_night.dart';
import 'package:filters/widgets/price_range_filter.dart';
import 'package:filters/widgets/my_app_bar.dart';
import 'package:filters/widgets/star_rating.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PricePerNight(),
              PriceRangeFilter(data: rawPriceData),
              Divider(color: Colors.grey[400], thickness: 1),
              AmenitiesFilter(),
              Divider(color: Colors.grey[400], thickness: 1),
              DistanceSlider(),
              Divider(color: Colors.grey[400], thickness: 1),
              StarRatingSelector(),
            ],
          ),
        ),
      ),
    );
  }
}

