import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'data/tour.dart';

class TourCarrousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Swiper(
        itemCount: Tour.defaultList.length,
        itemBuilder: (BuildContext context, int index) {
          return _TourContainer(Tour.defaultList[index]);
        },
        viewportFraction: 0.7,
        scale: 0.85,
      ),
    );
  }
}

class _TourContainer extends StatelessWidget {
  _TourContainer(this.tour);

  final Tour tour;
  // AssetImage(Tour.defaultList[index].imageUrl)
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(tour.imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
