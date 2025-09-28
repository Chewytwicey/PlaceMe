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

  // Add fromMap factory for safe reading from Firestore
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      title: map['title'] ?? 'Unknown',
      image: map['image'] ?? 'https://via.placeholder.com/64', // fallback image
    );
  }
}

final List<Category> categoriesList = [
  Category(
    title: "Apartment",
    image: "https://cdn4.iconfinder.com/data/icons/maps-navigation-24/24/commute_home_office_city_neighborhood_house_building-512.png",
  ),
  Category(
    title: "Boarding house",
    image: "https://cdn2.iconfinder.com/data/icons/the-urban-hustle-and-bustle/60/office-256.png",
  ),
  Category(
    title: "Dorm",
    image: "https://cdn2.iconfinder.com/data/icons/city-2/64/city-08-512.png",
  ),
  Category(
    title: "Apartment",
    image: "https://cdn4.iconfinder.com/data/icons/maps-navigation-24/24/commute_home_office_city_neighborhood_house_building-512.png",
  ),
  Category(
    title: "Boarding house",
    image: "https://cdn2.iconfinder.com/data/icons/the-urban-hustle-and-bustle/60/office-256.png",
  ),
  Category(
    title: "Dorm",
    image: "https://cdn2.iconfinder.com/data/icons/city-2/64/city-08-512.png",
  ),
];