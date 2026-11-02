import 'package:arc_raiders_guide_task2/data/models/item_list_state.dart';
import 'package:arc_raiders_guide_task2/data/models/pagination.dart';
import 'package:arc_raiders_guide_task2/data/services/end_point/api_endpoints.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_provider.g.dart';

@riverpod
class ItemNotifier extends _$ItemNotifier {
  @override
  ItemListState build() => const ItemListState();

  int page = 1;

  List<Pagination> pages = [];
  Future<void> loadData() async {
    if (state.isLoading || !state.hasMoreData) return;

    state = state.copyWith(isLoading: true);
//mdmd: exeption is not handeled. what if there were no internet ?.
    try {
      final data = await fetchData(page);

      state = state.copyWith(
        items: [...state.items, ...data.items],
        hasMoreData: data.pagination.hasNextPage,
      );
      page++;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
