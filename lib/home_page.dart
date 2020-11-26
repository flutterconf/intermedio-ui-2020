
import 'package:animation_challenge/tour_page_view.dart';
import 'package:animation_challenge/utils/tab_bar_icons.dart';
import 'package:animation_challenge/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils/stars_widget.dart';


/// Pagina principal
/// No hace falta editarla
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // AppBar 
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Welcome Simon',
                      style: Theme.of(context).textTheme.headline5
                    ),
                  ),
                  CircleAvatar(backgroundColor: Colors.grey[300]),
                ],
              ),
            ),
          ),
          // Carrusel de Tours 
          SliverToBoxAdapter(
            child: Container(
                height: 200,
                child: TourCarrousel(),
              ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Text(
                'Popular Tours',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              TourTile(
                title: 'Spain',
                subtitle: 'AMS - ALC',
                prices: '\$750',
                days: '7 days',
                imageUrl: 'assets/spain.jpeg',
              ),
              TourTile(
                title: 'Italy',
                subtitle: 'LEI - AHO',
                prices: '\$950',
                days: '4 days',
                imageUrl: 'assets/italy.jpeg',
              ),
              TourTile(
                title: 'Greece',
                subtitle: 'CFE - CHQ',
                prices: '\$800',
                days: '7 days',
                imageUrl: 'assets/greece.jpeg',
              ),
              TourTile(
                title: 'MALTA',
                subtitle: 'AMS - ALC',
                prices: '\$1250',
                days: '12 days',
                imageUrl: 'assets/malta.jpeg',
              ),
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: SizedBox(child: Icon(TabBarIcons.stars, size: 32,), height: 24,), label: "Hotels"),
          BottomNavigationBarItem(icon: Icon(TabBarIcons.compass), label: "Tours"),
          BottomNavigationBarItem(icon: Icon(TabBarIcons.heart), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(TabBarIcons.profile), label: "Profile"),
        ],
      ),
    );
  }
}

class TourTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String prices;
  final String days;

  const TourTile(
      {Key key,
      this.imageUrl,
      this.title,
      this.subtitle,
      this.prices,
      this.days})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 58,
            height: 58,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imageUrl),
                ),
                color: grayColor,
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.hardEdge,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 10),
                ),
                IconTheme(
                  data: IconThemeData(
                    color: Colors.amber,
                    size: 12,
                  ),
                  child: StarDisplay(value: 5),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(prices),
              Text(days, style: Theme.of(context).textTheme.caption),
            ],
          ),
        ],
      ),
    );
  }
}

