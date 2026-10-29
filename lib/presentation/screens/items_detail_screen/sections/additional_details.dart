import 'package:arc_raiders_guide_task2/constants.dart';
import 'package:arc_raiders_guide_task2/data/models/item.dart';
import 'package:arc_raiders_guide_task2/presentation/screens/items_detail_screen/sections/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdditionalDetails extends StatelessWidget {
  const AdditionalDetails({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final rarityColor = rarityColors[item.rarity.trim().toLowerCase()];
    final loadoutSlots = item.loadoutSlots
        .where((slot) => slot.trim().isNotEmpty)
        .join(', ');
    final workbench = item.workbench.trim();
    final shieldType = item.shieldType.trim();
    final hasLoadoutSlots = loadoutSlots.isNotEmpty;
    final hasWorkbench = workbench.isNotEmpty;
    final hasShieldType = shieldType.isNotEmpty;

    if (!hasLoadoutSlots && !hasWorkbench && !hasShieldType) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Details',
          style: GoogleFonts.barlow(
            color: rarityColor ?? Colors.grey,
            fontSize: 30,
            letterSpacing: -0.1,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: [
            if (hasLoadoutSlots)
              StatsCard(
                item: item,
                label: 'Loadout Slots',
                value: loadoutSlots,
              ),
            const SizedBox(height: 8),
            if (hasWorkbench)
              StatsCard(item: item, label: 'Workbench', value: workbench),

            const SizedBox(height: 8),
            if (hasShieldType)
              StatsCard(item: item, label: 'Shield Type', value: shieldType),
          ],
        ),
      ],
    );
  }
}
