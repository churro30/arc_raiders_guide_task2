import 'package:arc_raiders_guide_task2/constants.dart';
import 'package:arc_raiders_guide_task2/data/models/item.dart';
import 'package:arc_raiders_guide_task2/presentation/screens/items_detail_screen/sections/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    final rarityColor = rarityColors[item.rarity.trim().toLowerCase()];
    final description = item.description.trim();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: description.isNotEmpty
          ? [
              Text(
                'Description',
                style: GoogleFonts.barlow(
                  color: rarityColor ?? Colors.grey,
                  fontSize: 30,
                  letterSpacing: -0.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  if (description.isNotEmpty)
                    Expanded(
                      child: StatsCard(item: item, value: description),
                    ),
                ],
              ),
            ]
          : [],
    );
  }
}
