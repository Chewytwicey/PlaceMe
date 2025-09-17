import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> savePlacesToFirebase() async {
  final CollectionReference ref =
  FirebaseFirestore.instance.collection("myAppCpollection");
  for (final Place place in listOfPlace) {
    final String id =
        DateTime.now().toIso8601String() + Random().nextInt(1000).toString();
    await ref.doc(id).set(place.toMap());
  }
}

class Place {
  final String title;
  final bool isActive;
  final String image;
  final double rating;
  final String date;
  final int price;
  final String address;
  final String vendor;
  final String vendorProfession;
  final String vendorProfile;
  final int review;
  final String bedAndBathroom;
  final int yearOfHostin;
  final double latitude;
  final double longitude;
  final List<String> imageUrls;

  Place({
    required this.title,
    required this.isActive,
    required this.image,
    required this.rating,
    required this.date,
    required this.price,
    required this.address,
    required this.vendor,
    required this.vendorProfession,
    required this.vendorProfile,
    required this.review,
    required this.bedAndBathroom,
    required this.yearOfHostin,
    required this.latitude,
    required this.longitude,
    required this.imageUrls,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isActive': isActive,
      'image': image,
      'rating': rating,
      'date': date,
      'price': price,
      'address': address,
      'vendor': vendor,
      'vendorProfession': vendorProfession,
      'vendorProfile': vendorProfile,
      'review': review,
      'bedAndBathroom': bedAndBathroom,
      'yearOfHostin': yearOfHostin,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrls': imageUrls,
    };
  }
}

final List<Place> listOfPlace = [
  Place(
    isActive: true,
    title: "Nice small bedroom in a nice small house",
    image: "https://ph.pinterest.com/pin/379428337378475431/",
    rating: 4.85,
    review: 126,
    bedAndBathroom: "1 bed . Shared bathroom",
    date: "Nov 11-16",
    price: 38,
    address: "Kathmandu, Nepal",
    vendor: "Marianne",
    vendorProfession: "Retired",
    yearOfHostin: 10,
    vendorProfile: "https://ph.pinterest.com/pin/379428337378475431/",
    latitude: 27.7172,
    longitude: 85.3240,
    imageUrls: [
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
    ],
  ),
  Place(
    isActive: false,
    title: "En-Suite @ Sunrise Beach",
    image: "https://ph.pinterest.com/pin/379428337378475431/",
    rating: 4.90,
    review: 292,
    yearOfHostin: 10,
    bedAndBathroom: "1 double bed . Dedicated bathroom",
    date: "Jan 26-29",
    price: 160,
    address: "Rome, Italy",
    vendor: "Leva",
    vendorProfession: "Teacher",
    vendorProfile: "https://ph.pinterest.com/pin/379428337378475431/",
    latitude: 41.8967,
    longitude: 12.4822,
    imageUrls: [
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
    ],
  ),
  Place(
    isActive: true,
    title: "Cozy private room in a vibrant neighborhood",
    image: "https://ph.pinterest.com/pin/379428337378475431/",
    rating: 4.75,
    review: 85,
    bedAndBathroom: "1 king bed . Private bathroom",
    date: "Dec 1-5",
    price: 75,
    address: "New York, USA",
    vendor: "John",
    vendorProfession: "Software Engineer",
    yearOfHostin: 5,
    vendorProfile: "https://ph.pinterest.com/pin/379428337378475431/",
    latitude: 40.7128,
    longitude: -74.0060,
    imageUrls: [
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
    ],
  ),
  Place(
    isActive: true,
    title: "Studio apartment with a stunning view",
    image: "https://ph.pinterest.com/pin/379428337378475431/",
    rating: 4.95,
    review: 420,
    bedAndBathroom: "1 queen bed . Private bathroom",
    date: "Nov 20-25",
    price: 120,
    address: "Paris, France",
    vendor: "Sophie",
    vendorProfession: "Architect",
    yearOfHostin: 8,
    vendorProfile: "https://ph.pinterest.com/pin/379428337378475431/",
    latitude: 48.8566,
    longitude: 2.3522,
    imageUrls: [
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
    ],
  ),
  Place(
    isActive: false,
    title: "Charming cottage near the lake",
    image: "https://ph.pinterest.com/pin/379428337378475431/",
    rating: 4.60,
    review: 150,
    bedAndBathroom: "2 double beds . Shared bathroom",
    date: "Jan 10-15",
    price: 90,
    address: "Lake District, UK",
    vendor: "David",
    vendorProfession: "Photographer",
    yearOfHostin: 3,
    vendorProfile: "https://ph.pinterest.com/pin/379428337378475431/",
    latitude: 54.4609,
    longitude: -3.0886,
    imageUrls: [
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
      "https://ph.pinterest.com/pin/379428337378475431/",
    ],
  ),
];
