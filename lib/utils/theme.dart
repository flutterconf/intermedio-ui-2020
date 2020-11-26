import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textTheme = GoogleFonts.heeboTextTheme();

final primaryColor = Color(0xFF2359FF);
final accentColor = Color(0xFFFFA932);
final darkColor = Color(0xFF0B0B0B);
final whiteColor = Color(0xFFD8D8D8);
final grayColor = Color(0xFFA0A0A0);

ThemeData defaultTheme = ThemeData(
  
  textTheme: textTheme.copyWith(
    headline6: TextStyle(
      fontWeight: FontWeight.w600,
      color: darkColor,
    ),
    headline5: TextStyle(
        fontWeight: FontWeight.w700,
        color: darkColor,
        letterSpacing: 1.2,
        fontSize: 20),
  ),
  primaryTextTheme: TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.w200,
      fontSize: 16,
      height: 1.5,
    ),
  ),
  primaryColor: primaryColor,
  primaryColorBrightness: Brightness.dark,
  accentColor: accentColor,
  primarySwatch: Colors.blue,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: darkColor,
      unselectedItemColor: grayColor,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed),
  // Evita la animación de la ruta anterior cuando la nueva esta se está
  // colocando encima.
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoExpandedPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoExpandedPageTransitionsBuilder(),
    TargetPlatform.linux: CupertinoExpandedPageTransitionsBuilder(),
    TargetPlatform.macOS: CupertinoExpandedPageTransitionsBuilder(),
    TargetPlatform.windows: CupertinoExpandedPageTransitionsBuilder(),
  }),
);

class TourPageRoute<T> extends MaterialPageRoute<T> {
  TourPageRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            maintainState: maintainState,
            settings: settings,
            fullscreenDialog: fullscreenDialog,
            builder: builder);

  @override
  Duration get transitionDuration => Duration(seconds: 1);

  @override
    // TODO: implement reverseTransitionDuration
    Duration get reverseTransitionDuration => Duration(milliseconds: 800);
}

/// Transición que evita la transición propia de las rutas cupertino en la
/// que la ruta anterior se desplaza horizontalmente,
class CupertinoExpandedPageTransitionsBuilder extends PageTransitionsBuilder {
  /// Construct a [CupertinoPageTransitionsBuilder].
  const CupertinoExpandedPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return CupertinoRouteTransitionMixin.buildPageTransitions<T>(route, context,
        kAlwaysCompleteAnimation, kAlwaysDismissedAnimation, child);
  }
}
