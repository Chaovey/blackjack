// ignore_for_file: must_be_immutable, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, file_names

import 'package:flutter/material.dart';

class DealerCard extends StatelessWidget {
  final String card;
  final bool game;

  const DealerCard({super.key, required this.card, required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Text(
        '${game ? card : '🂠'}',
        style: const TextStyle(fontSize: 100),
      ),
    );
  }
}
