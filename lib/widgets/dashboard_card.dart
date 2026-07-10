import 'package:flutter/material.dart';

class DashboardCard extends StatefulWidget {

  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  @override
  State<DashboardCard> createState() =>
      _DashboardCardState();
}

class _DashboardCardState
    extends State<DashboardCard> {

  bool hovering = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(

      onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },

      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },

      child: AnimatedContainer(

        duration:
            const Duration(
          milliseconds: 200,
        ),

        transform:
            Matrix4.identity()
              ..translate(
                0.0,
                hovering ? -8 : 0,
              ),

        child: Card(
          elevation:
              hovering ? 12 : 3,

          child: InkWell(
            onTap: widget.onTap,

            child: Padding(
              padding:
                  const EdgeInsets.all(16.0),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Image.asset(
                    widget.image,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    widget.title,
                    style:
                        const TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  Text(
                    widget.subtitle,
                    style:
                        const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}