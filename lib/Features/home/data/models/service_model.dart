import '../../../../core/utils/assets.dart';

class ServiceModel {
  final String name;

  final String discount;

  final String imageUrl;

  ServiceModel({
    required this.name,
    required this.discount,
    required this.imageUrl,
  });
  static List<ServiceModel> get services => [
        ServiceModel(
          name: 'Food',
          discount: 'Up to 50%',
          imageUrl: Assets.foot,
        ),
        ServiceModel(
          name: 'Health &\nwelness',
          discount: '20mins',
          imageUrl: Assets.health,
        ),
        ServiceModel(
          name: 'Groceries',
          discount: '15mins',
          imageUrl: Assets.groceries,
        ),
      ];
}
