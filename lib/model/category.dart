import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

// to upload data in firebase
Future<void> saveCategoryItems() async {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection("AppCategory");
  for (final Category category in categoriesList) {
    final String id =
        DateTime.now().toIso8601String() + Random().nextInt(1000).toString();
    await ref.doc(id).set(category.toMap());
  }
}

class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
    };
  }
}

final List<Category> categoriesList = [
  Category(
    title: "Category 1",
    image: "https://ph.pinterest.com/pin/1100215383978978412/",
  ),
  Category(
    title: "Category 2",
    image: "https://ph.pinterest.com/pin/1100215383978978412/",
  ),
  Category(
    title: "Category 3",
    image: "https://ph.pinterest.com/pin/1100215383978978412/",
  ),
  Category(
    title: "Surfing",
    image: "https://ph.pinterest.com/pin/1100215383978978412/",
  ),
  Category(
    title: "Design",
    image: "https://ph.pinterest.com/pin/1100215383978978412/",
  ),
  Category(
    title: "Amazing views",
    image: "https://ph.pinterest.com/pin/1100215383978978412/",
  ),
  Category(
    title: "New",
    image: "https://ph.pinterest.com/pin/1100215383978978412/",
  ),
  Category(
    title: "Bed&breakfasts",
    image: "https://ph.pinterest.com/pin/1100215383978978412/",
  ),
  Category(
    title: "Houseboats",
    image: "https://ph.pinterest.com/pin/1100215383978978412/",
  ),
];