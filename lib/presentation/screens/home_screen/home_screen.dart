import 'package:arc_raiders_guide_task2/data/models/arc_raider_data.dart';
import 'package:arc_raiders_guide_task2/data/provider/item_provider.dart';
import 'package:arc_raiders_guide_task2/presentation/screens/home_screen/app_bar_design/stripe_color.dart';
import 'package:arc_raiders_guide_task2/presentation/screens/home_screen/list_item.dart';
import 'package:arc_raiders_guide_task2/presentation/screens/items_detail_screen/item_details.dart';
import 'package:arc_raiders_guide_task2/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Future<ArcRaiderItemData> futureArcRiaderData;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollController);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(itemProvider.notifier).loadData();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemState = ref.watch(itemProvider);
    final items = itemState.items;

    return Scaffold(
      appBar: AppBar(
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StripeColor(color: AppColors.primaryRed),
            StripeColor(color: AppColors.primaryYellow),
            StripeColor(color: AppColors.primaryGreen),
            StripeColor(color: AppColors.primaryCyan),
          ],
        ),
        title: Row(
          children: [
            Text('Arc Raiders', style: Theme.of(context).textTheme.titleMedium),
            Text(' Guide', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length + 1,
          controller: scrollController,
          itemBuilder: (BuildContext context, index) {
            if (index < items.length) {
              return items.isNotEmpty
                  ? GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetails(item: items[index]),
                        ),
                      ),
                      child: ListItem(item: items[index]),
                    )
                  : Center(child: Text('No Data Loaded'));
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: (itemState.hasMoreData || itemState.isLoading)
                      ? CircularProgressIndicator()
                      : Text("No More Data to Load"),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void _scrollController() async {
    if (scrollController.position.extentAfter < 200) {
      await ref.read(itemProvider.notifier).loadData();
    }
  }
}
