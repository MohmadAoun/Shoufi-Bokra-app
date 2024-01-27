import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class TrendingEventsCarousel extends StatelessWidget {
  final List<String> imagesUrl;
  const TrendingEventsCarousel({
    super.key,
    required this.imagesUrl,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      items: imagesUrl.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: CachedNetworkImage(
                imageUrl: i,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.2,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        showIndicator: true,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        indicatorMargin: 3,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        slideIndicator: const CircularSlideIndicator(),
      ),
    );
  }
}
