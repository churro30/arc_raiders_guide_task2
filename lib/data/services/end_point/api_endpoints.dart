import 'dart:convert';

import 'package:arc_raiders_guide_task2/data/models/arc_raider_data.dart';
import 'package:http/http.dart' as http;

Future<ArcRaiderItemData> fetchData(int page) async {
  final itemURL = "https://metaforge.app/api/arc-raiders/items?page=$page";

  final response = await http.get(
    Uri.parse(itemURL),
    headers: {'Accept': 'application/json'},
  );

  if (response.statusCode == 200) {
    return ArcRaiderItemData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data: ${response.statusCode}');
  }
}
