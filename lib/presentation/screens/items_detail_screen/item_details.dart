import 'package:arc_raiders_guide_task2/data/models/item.dart';
import 'package:arc_raiders_guide_task2/presentation/screens/items_detail_screen/sections/additional_details.dart';
import 'package:arc_raiders_guide_task2/presentation/screens/items_detail_screen/sections/description.dart';
import 'package:arc_raiders_guide_task2/presentation/screens/items_detail_screen/sections/item_header.dart';
import 'package:arc_raiders_guide_task2/presentation/screens/items_detail_screen/sections/overview.dart';
import 'package:arc_raiders_guide_task2/presentation/screens/items_detail_screen/sections/quick_stats.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Item Details',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            ItemHeader(item: item),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  QuickStats(item: item),
                  const SizedBox(height: 10),
                  Overview(item: item),
                  const SizedBox(height: 10),
                  Description(item: item),
                  const SizedBox(height: 10),
                  AdditionalDetails(item: item),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
