import 'package:flutter/material.dart';

import '../models/sintoma.dart';

class SintomaCard extends StatelessWidget {

  final Sintoma sintoma;
  final VoidCallback onTap;

  const SintomaCard({
    super.key,
    required this.sintoma,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,

      child: Card(
        elevation: 5,

        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15),
        ),

        child: Column(
          children: [

            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(
                  topLeft:
                      Radius.circular(15),
                  topRight:
                      Radius.circular(15),
                ),

                child: Image.asset(
                  sintoma.imagen,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.all(10),

              child: Text(
                sintoma.nombre,

                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}