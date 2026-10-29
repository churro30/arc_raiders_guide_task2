class Item {
  final String id;
  final String name;
  final String imageUrl;
  final String rarity;
  final String value;
  final String weight;
  final String itemType;
  final String description;
  final String subcategory;
  final List<String> loadoutSlots;
  final String workbench;
  final String shieldType;

  Item({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rarity,
    required this.value,
    required this.weight,
    required this.itemType,
    required this.description,
    required this.subcategory,
    required this.loadoutSlots,
    required this.workbench,
    required this.shieldType,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    final rawStatBlock = json['stat_block'];
    final statBlock = rawStatBlock is Map<String, dynamic>
        ? rawStatBlock
        : const <String, dynamic>{};

    return Item(
      id: json['id'],
      name: json['name'],
      imageUrl: json['icon'] ?? '',
      rarity: json['rarity'] ?? '',
      value: (json['value'] ?? statBlock['value'])?.toString() ?? '',
      weight: (json['weight'] ?? statBlock['weight'])?.toString() ?? '',
      itemType: json['item_type'] ?? '',
      description: json['description'] ?? '',
      subcategory: json['subcategory'] ?? '',
      loadoutSlots:
          (json['loadout_slots'] as List<dynamic>?)
              ?.whereType<String>()
              .toList() ??
          [],
      workbench: json['workbench'] ?? '',
      shieldType: json['shield_type'] ?? '',
    );
  }
}
