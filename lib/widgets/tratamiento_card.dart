import 'package:flutter/material.dart';
import '../models/tratamiento.dart';

class TratamientoCard extends StatelessWidget {

  final Tratamiento tratamiento;
  final VoidCallback onTap;

  const TratamientoCard({
    super.key,
    required this.tratamiento,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,

      child: Card(
        clipBehavior: Clip.antiAlias,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          children: [

            Expanded(
              child: Image.asset(
                tratamiento.icono,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),

              child: Text(
                tratamiento.titulo,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}