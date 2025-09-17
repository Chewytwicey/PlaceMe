import 'package:flutter/material.dart';

class AnotherCarousel extends StatelessWidget {
  final List<ImageProvider> image;
  final double dotSize;
  final double indicatorBgPadding;
  final Color dotBgcolor;

  const AnotherCarousel({
    required this.image,
    this.dotSize = 6,
    this.indicatorBgPadding = 5,
    this.dotBgcolor = Colors.transparent, 
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image.isNotEmpty ? image[0] : const AssetImage('assets/placeholder.png'),
      fit: BoxFit.cover,
    );
  }
}