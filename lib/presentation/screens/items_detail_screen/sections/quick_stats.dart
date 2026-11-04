import 'package:arc_raiders_guide_task2/constants.dart';
import 'package:arc_raiders_guide_task2/data/models/item.dart';
import 'package:arc_raiders_guide_task2/presentation/screens/items_detail_screen/sections/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickStats extends StatelessWidget {
  const QuickStats({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {

    final rarityColor = rarityColors[item.rarity.trim().toLowerCase()];
    //mdmd: why the trim ?
    final value = item.value.trim();
    final weight = item.weight.trim();
    final hasQuickStats = value.isNotEmpty || weight.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: hasQuickStats
          ? [
              Text(
                'Quick Stats',
                //mdmd: google fonts ??? i am disappointed.
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
                  if (value.isNotEmpty)
                    Expanded(
                      child: StatsCard(
                        item: item,
                        label: 'Value',
                        value: value,
                      ),
                    ),
                  const SizedBox(width: 12),
                  if (weight.isNotEmpty)
                    Expanded(
                      child: StatsCard(
                        item: item,
                        label: 'Weight',
                        value: weight,
                      ),
                    ),
                ],
              ),
            ]
          : const [],
    );
  }
}
