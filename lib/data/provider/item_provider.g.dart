// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ItemNotifier)
const itemProvider = ItemNotifierProvider._();

final class ItemNotifierProvider
    extends $NotifierProvider<ItemNotifier, ItemListState> {
  const ItemNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemNotifierHash();

  @$internal
  @override
  ItemNotifier create() => ItemNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItemListState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemListState>(value),
    );
  }
}

String _$itemNotifierHash() => r'15b679c7e58a98f7a6efc9a3b8865f06338d6df0';

abstract class _$ItemNotifier extends $Notifier<ItemListState> {
  ItemListState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ItemListState, ItemListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ItemListState, ItemListState>,
              ItemListState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
