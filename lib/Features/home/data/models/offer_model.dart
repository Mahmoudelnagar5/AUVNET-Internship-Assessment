import '../../../../core/utils/assets.dart';

class OfferModel {
  final String image;

  const OfferModel({required this.image});

  static List<OfferModel> get images => [
        const OfferModel(image: Assets.offer),
        const OfferModel(image: Assets.offer),
        const OfferModel(image: Assets.offer),
      ];
}
