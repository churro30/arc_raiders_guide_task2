import 'package:arc_raiders_guide_task2/constants.dart';
import 'package:arc_raiders_guide_task2/data/models/item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemHeader extends StatelessWidget {
  const ItemHeader({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    final rarity = item.rarity.trim();
    final rarityColor = rarityColors[item.rarity.trim().toLowerCase()];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: rarityColor?.withValues(alpha: 0.12),
          border: Border.all(
            color:
                rarityColor?.withValues(alpha: 0.5) ??
                Colors.grey.withValues(alpha: 0.5),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Hero(
              tag: item.id.toString(),
              child: Image.network(item.imageUrl, width: 120, height: 120),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),

                  if (rarity.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: rarityColor?.withValues(alpha: 0.12),
                        border: Border.all(
                          color:
                              rarityColor?.withValues(alpha: 0.5) ??
                              Colors.grey.withValues(alpha: 0.5),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        item.rarity.toUpperCase(),
                        style: GoogleFonts.barlow(
                          textStyle: TextStyle(
                            color: rarityColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
