import 'package:arc_raiders_guide_task2/constants.dart';
import 'package:arc_raiders_guide_task2/data/models/item.dart';
import 'package:arc_raiders_guide_task2/presentation/screens/items_detail_screen/sections/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Overview extends StatelessWidget {
  const Overview({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final rarityColor = rarityColors[item.rarity.trim().toLowerCase()];
    final itemType = item.itemType.trim();
    final subcategory = item.subcategory.trim();
    final hasOverview = itemType.isNotEmpty || subcategory.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: hasOverview
          ? [
              Text(
                'Overview',
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
                  if (itemType.isNotEmpty)
                    Expanded(
                      child: StatsCard(
                        item: item,
                        label: 'Item Type',
                        value: itemType,
                      ),
                    ),
                  const SizedBox(width: 12),
                  if (subcategory.isNotEmpty)
                    Expanded(
                      child: StatsCard(
                        item: item,
                        label: 'Subcategory',
                        value: subcategory,
                      ),
                    ),
                ],
              ),
            ]
          : const [],
    );
  }
}
