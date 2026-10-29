import 'package:arc_raiders_guide_task2/data/models/item.dart';
import 'package:arc_raiders_guide_task2/data/models/pagination.dart';

class ArcRaiderItemData {
  final List<Item> items;
  final Pagination pagination;

  ArcRaiderItemData({required this.items, required this.pagination});

  factory ArcRaiderItemData.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];
    final rawPagination = json['pagination'];

    return ArcRaiderItemData(
      items: rawData.map<Item>((item) {
        return Item.fromJson(item);
      }).toList(),
      pagination: Pagination.fromJson(rawPagination),
    );
  }
}
