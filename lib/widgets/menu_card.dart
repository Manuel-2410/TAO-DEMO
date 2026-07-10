import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  final double height;

  const MenuCard({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        child: Stack(
          children: [
            SizedBox(
              height: height,
              width: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                color: Colors.black54,

                alignment: Alignment.center,

                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}