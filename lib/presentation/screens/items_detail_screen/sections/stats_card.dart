import 'package:arc_raiders_guide_task2/constants.dart';
import 'package:arc_raiders_guide_task2/data/models/item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
    required this.item,
    this.label,
    required this.value,
  });
  final Item item;
  final String? label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final rarityColor = rarityColors[item.rarity.trim().toLowerCase()];
    final borderColor =
        rarityColor?.withValues(alpha: 0.5) ??
        Colors.grey.withValues(alpha: 0.35);
    final displayLabel = label?.trim();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF101317),
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (displayLabel != null && displayLabel.isNotEmpty) ...[
            Text(
              displayLabel.toUpperCase(),
              style: GoogleFonts.barlow(
                color: Colors.white60,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 6),
          ],
          Text(
            value,
            style: GoogleFonts.barlow(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
