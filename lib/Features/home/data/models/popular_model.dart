import '../../../../core/utils/assets.dart';

class PopularModel {
  final String image;
  final String name;
  final String time;

  const PopularModel(
      {required this.image, required this.name, required this.time});
  static List<PopularModel> getPopular() {
    return [
      PopularModel(
        image: Assets.allo,
        name: 'Allo Beirut ',
        time: '32 mins',
      ),
      PopularModel(
        image: Assets.laffah,
        name: 'Laffah',
        time: '38 mins',
      ),
      PopularModel(
        image: Assets.ai,
        name: 'Falafil AlRabiah Al kha...',
        time: '44 mins',
      ),
      PopularModel(
        image: Assets.barbar,
        name: 'Barbar',
        time: '34 mins',
      ),
    ];
  }
}
