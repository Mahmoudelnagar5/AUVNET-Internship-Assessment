class IntroModel {
  final String title;
  final String subTitle;

  const IntroModel({
    required this.title,
    required this.subTitle,
  });
  static const List<IntroModel> introductionList = [
    IntroModel(
      title: 'all-in-one delivery ',
      subTitle:
          'Order groceries, medicines, and meals delivered straight to your door',
    ),
    IntroModel(
      title: 'User-to-User Delivery',
      subTitle: 'Send or receive items from other users quickly and easily',
    ),
    IntroModel(
      title: 'Sales & Discounts',
      subTitle: 'Discover exclusive sales and deals every day',
    ),
  ];
}
