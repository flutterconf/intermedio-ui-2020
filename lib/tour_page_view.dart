import 'package:animation_challenge/screens/tour_details.dart';
import 'package:animation_challenge/utils/theme.dart';
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

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TourDetailsPage(tour)),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(tour.imageUrl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tour.title,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "CustomIcons",
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                tour.subtitle,
                style: TextStyle(
                    color: whiteColor,
                    fontFamily: "CustomIcons",
                    fontSize: 15,
                    fontWeight: FontWeight.w200),
              )
            ],
          ),
        ),
      ),
    );
  }
}
