// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating;
  const StarRating({super.key, required this.rating});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  Widget star(bool fill) {
    return Icon(
      Icons.star,
      size: 18,
      color: fill ? Colors.black : Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index){
        if (index < (widget.rating).round()){
          return star(true);
        }else {
          return star(false);
        }
      }),
    );
  }
}
