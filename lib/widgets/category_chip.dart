import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {

  final String text;

  final bool selected;

  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return FilterChip(
      label: Text(text),

      selected: selected,

      onSelected: (_) {
        onTap();
      },
    );
  }
}