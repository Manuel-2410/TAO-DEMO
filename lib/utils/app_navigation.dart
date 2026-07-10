import 'package:flutter/material.dart';

class AppNavigation {

  static Future push(
    BuildContext context,
    Widget page,
  ) {

    return Navigator.push(
      context,

      PageRouteBuilder(

        transitionDuration:
            const Duration(
          milliseconds: 300,
        ),

        pageBuilder:
            (_, _, _) =>
                page,

        transitionsBuilder:
            (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {

          return FadeTransition(
            opacity: animation,

            child: SlideTransition(
              position:
                  Tween(
                begin:
                    const Offset(
                  .1,
                  0,
                ),

                end:
                    Offset.zero,
              ).animate(
                animation,
              ),

              child: child,
            ),
          );
        },
      ),
    );
  }
}