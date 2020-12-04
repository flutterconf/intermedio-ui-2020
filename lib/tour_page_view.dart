import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/tour.dart';

class TourCarrousel extends StatefulWidget {
  @override
  _TourCarrouselState createState() => _TourCarrouselState();
}

class _TourCarrouselState extends State<TourCarrousel> {
  final _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: 400.0,
      ),
      items: Tour.defaultList.map((tour) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              child: TourHero(tour: tour),
              onTap: () async {
                Tour selectedTour = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FullScreenTour(selectedTour: tour),
                    fullscreenDialog: true,
                  ),
                );
                final pageIndex =
                    Tour.defaultList.indexWhere((t) => t.id == selectedTour.id);
                _controller.jumpToPage(pageIndex);
              },
            );
          },
        );
      }).toList(),
    );
  }
}

class FullScreenTour extends StatelessWidget {
  final Tour selectedTour;

  const FullScreenTour({Key key, this.selectedTour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final initialPage =
        Tour.defaultList.indexWhere((tour) => tour.id == selectedTour.id);

    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          height: size.height,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          initialPage: initialPage,
        ),
        items: Tour.defaultList.map((tour) {
          return Builder(
            builder: (BuildContext context) {
              return Stack(
                children: [
                  TourHero(
                    tour: tour,
                    fullScreen: true,
                  ),
                  BackButton(
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pop(tour),
                  ),
                ],
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class TourHero extends StatelessWidget {
  final Tour tour;
  final bool fullScreen;

  const TourHero({Key key, this.tour, this.fullScreen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline6.copyWith(color: Colors.white);
    final subtitleStyle = theme.textTheme.caption.copyWith(color: Colors.white);
    return Hero(
      tag: tour.id,
      key: Key(tour.id),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: fullScreen ? 0 : 5.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(fullScreen ? 0 : 10),
          image: DecorationImage(
            image: AssetImage(
              tour.imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                tour.title,
                style: titleStyle,
              ),
              Text(
                tour.subtitle,
                style: subtitleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
