import '../../../../core/utils/assets.dart';

class ShortcutModel {
  final String icon;
  final String label;

  const ShortcutModel({required this.icon, required this.label});

  static List<ShortcutModel> get shortcuts => [
        const ShortcutModel(
          icon: Assets.past,
          label: 'Past\nOrders',
        ),
        const ShortcutModel(
          icon: Assets.security,
          label: 'Super\nSaver',
        ),
        const ShortcutModel(
          icon: Assets.star,
          label: 'Must-tries',
        ),
        const ShortcutModel(
          icon: Assets.give,
          label: 'Give Back',
        ),
        const ShortcutModel(
          icon: Assets.bestSeller,
          label: 'Best\nSellers',
        ),
      ];
}
