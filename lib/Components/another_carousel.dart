import 'package:flutter/material.dart';
import 'dart:async';

class AnotherCarousel extends StatefulWidget {
  final List<ImageProvider> images;
  final double dotSize;
  final double indicatorBgPadding;
  final Color dotBgColor;
  final bool showIndicator;
  final Function(int)? onImageChange;
  final bool autoplay;
  final BoxFit boxfit;

  const AnotherCarousel({
    required this.images,
    this.dotSize = 6,
    this.indicatorBgPadding = 5,
    this.dotBgColor = Colors.black,
    this.showIndicator = true,
    this.onImageChange,
    this.autoplay = true,
    this.boxfit = BoxFit.cover,
    super.key,
  });

  @override
  State<AnotherCarousel> createState() => _AnotherCarouselState();
}

class _AnotherCarouselState extends State<AnotherCarousel> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.autoplay && widget.images.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
        if (_controller.hasClients) {
          int nextPage = (_currentPage + 1) % widget.images.length;
          _controller.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return SizedBox();
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: widget.images.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
            widget.onImageChange?.call(index);
          },
          itemBuilder: (context, index) {
            return Image(
              image: widget.images[index],
              fit: BoxFit.cover,
            );
          },
        ),
        if (widget.showIndicator)
          Positioned(
            bottom: widget.indicatorBgPadding + 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: widget.dotSize,
                  height: widget.dotSize,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.white : widget.dotBgColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}