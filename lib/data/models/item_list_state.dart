import 'item.dart';

class ItemListState {
  final List<Item> items;
  final bool hasMoreData;
  final bool isLoading;

  const ItemListState({
    this.items = const [],
    this.hasMoreData = true,
    this.isLoading = false,
  });

  ItemListState copyWith({
    List<Item>? items,
    bool? hasMoreData,
    bool? isLoading,
  }) {
    return ItemListState(
      items: items ?? this.items,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
