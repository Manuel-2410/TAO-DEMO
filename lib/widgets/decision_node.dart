import 'package:flutter/material.dart';

class DecisionNode extends StatelessWidget {
  final String title;

  const DecisionNode({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.785398, // 45 grados

      child: Container(
        width: 140,
        height: 140,

        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(12),

          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black26,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Transform.rotate(
          angle: -0.785398,

          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),

              child: Text(
                title,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}