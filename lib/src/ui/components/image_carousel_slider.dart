import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageCarouselSlider extends StatelessWidget {
  ImageCarouselSlider({Key? key, required this.images}) : super(key: key);

  final List<String> images;

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Container(
        color: Colors.white,
        height: 250,
        width: double.infinity,
        child: const Center(
          child: Text("No image for the product."),
        ),
      );
    }
    return Stack(
      children: [
        CarouselSlider(
          items: images
              .map(
                (url) => Builder(
                  builder: (context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        image: DecorationImage(
                          image: NetworkImage(url),
                        ),
                      ),
                    );
                  },
                ),
              )
              .toList(),
          options: CarouselOptions(
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              autoPlay: false,
              onPageChanged: (index, _) {
                _currentIndex.value = index;
              }),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 8.0,
              ),
              margin: const EdgeInsets.all(12.0),
              height: 28,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.black38.withOpacity(0.5),
                borderRadius: BorderRadius.circular(26),
              ),
              alignment: Alignment.center,
              child: ValueListenableBuilder(
                valueListenable: _currentIndex,
                builder: (context, currentValue, _) {
                  return Text(
                    "${currentValue + 1} / ${images.length}",
                    style: GoogleFonts.josefinSans(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
