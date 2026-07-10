import 'package:flutter/material.dart';

class FlowGroup extends StatelessWidget {

  final String title;

  final double left;
  final double top;

  final double width;
  final double height;

  const FlowGroup({
    super.key,
    required this.title,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  @override
  Widget build(
      BuildContext context) {

    return Positioned(
      left: left,
      top: top,

      child: Container(
        width: width,
        height: height,

        decoration:
            BoxDecoration(

          border: Border.all(
            color:
                Colors.grey.shade400,
          ),

          borderRadius:
              BorderRadius.circular(
                  12),
        ),

        child: Align(
          alignment:
              Alignment.topCenter,

          child: Container(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),

            color:
                Colors.white,

            child: Text(
              title,

              style:
                  const TextStyle(
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}