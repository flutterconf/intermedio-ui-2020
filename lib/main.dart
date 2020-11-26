import 'package:animation_challenge/data/tour.dart';
import 'package:animation_challenge/utils/theme.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Precache images
    Tour.defaultList.forEach((tour) {
      precacheImage(AssetImage(tour.imageUrl), context);
    });
    return MaterialApp(
      title: 'Flutter in the Dark Challenge',
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: HomePage(),
    );
  }
}
