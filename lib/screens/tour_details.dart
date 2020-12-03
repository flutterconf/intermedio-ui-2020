import 'package:animation_challenge/data/tour.dart';
import 'package:animation_challenge/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TourDetailsPage extends StatelessWidget {
  TourDetailsPage(this.tour);

  final Tour tour;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      index: Tour.defaultList.indexOf(tour),
      itemCount: Tour.defaultList.length,
      itemBuilder: (BuildContext context, int index) {
        return _TourDetailSinglePage(tour: Tour.defaultList[index]);
      },
    );
  }
}

class _TourDetailSinglePage extends StatelessWidget {
  const _TourDetailSinglePage({
    Key key,
    @required this.tour,
  }) : super(key: key);

  final Tour tour;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          tour.imageUrl,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30.0,
                      color: Colors.white,
                      semanticLabel: 'Back',
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    tour.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "CustomIcons",
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    tour.description,
                    style: TextStyle(
                        color: whiteColor,
                        fontFamily: "CustomIcons",
                        fontSize: 20,
                        fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
