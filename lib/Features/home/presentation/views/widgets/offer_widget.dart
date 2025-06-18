import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/models/offer_model.dart';

class OfferWidget extends StatefulWidget {
  const OfferWidget({super.key});

  @override
  State<OfferWidget> createState() => _OfferWidgetState();
}

class _OfferWidgetState extends State<OfferWidget> {
  final PageController _controller = PageController();
  final images = OfferModel.images;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: _controller,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(images[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: _controller,
          count: images.length,
          effect: const ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Color(0xff8900FE),
          ),
        ),
      ],
    );
  }
}
