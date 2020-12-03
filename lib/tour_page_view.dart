import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/tour.dart';

class TourCarrousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline6.copyWith(color: Colors.white);
    final subtitleStyle = theme.textTheme.caption.copyWith(color: Colors.white);

    return CarouselSlider(
      options: CarouselOptions(height: 400.0),
      items: Tour.defaultList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              child: Hero(
                tag: i.id,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        i.imageUrl,
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
                          i.title,
                          style: titleStyle,
                        ),
                        Text(
                          i.subtitle,
                          style: subtitleStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FullScreenTour(selectedItem: i),
                    fullscreenDialog: true,
                  ),
                );
              },
            );
          },
        );
      }).toList(),
    );
  }
}

class FullScreenTour extends StatelessWidget {
  final Tour selectedItem;

  const FullScreenTour({Key key, this.selectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline6.copyWith(color: Colors.white);
    final subtitleStyle = theme.textTheme.caption.copyWith(color: Colors.white);

    final initialPage = Tour.defaultList.indexOf(selectedItem);

    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          height: size.height,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          initialPage: initialPage,
        ),
        items: Tour.defaultList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Stack(
                children: [
                  Hero(
                    tag: i.id,
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            i.imageUrl,
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
                              i.title,
                              style: titleStyle,
                            ),
                            Text(
                              i.subtitle,
                              style: subtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BackButton(
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pop(),
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
