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
    image: "https://d1hy6t2xeg0mdl.cloudfront.net/image/623004/473be481ff/standard",
    rating: 4.85,
    review: 126,
    bedAndBathroom: "1 bed · Shared bathroom",
    date: "Nov 11-16",
    price: 1500,
    address: "Quezon City, Metro Manila",
    vendor: "Juan Dela Cruz",
    vendorProfession: "Retired",
    yearOfHostin: 10,
    vendorProfile: "https://tse1.mm.bing.net/th/id/OIP.L58zPXmBoGITv0II_nDnAwHaFA?rs=1&pid=ImgDetMain&o=7&rm=3",
    latitude: 14.6760,
    longitude: 121.0437,
    imageUrls: [
      "https://d1hy6t2xeg0mdl.cloudfront.net/image/623004/473be481ff/standard",
      "https://tse1.mm.bing.net/th/id/OIP.L58zPXmBoGITv0II_nDnAwHaFA?rs=1&pid=ImgDetMain&o=7&rm=3",
      "https://cdn.home-designing.com/wp-content/uploads/2017/11/one-room-apartment-design.jpg",
      "https://decoholic.org/wp-content/uploads/2019/04/small-apartment-design-idea-8.jpg",
      "https://tse1.explicit.bing.net/th/id/OIP.rSp0maHUShJGcrdjs20ETQHaFj?w=1024&h=768&rs=1&pid=ImgDetMain&o=7&rm=3",
    ],
  ),
  Place(
    isActive: false,
    title: "En-Suite @ Sunrise Beach",
    image: "https://tse1.mm.bing.net/th/id/OIP.L58zPXmBoGITv0II_nDnAwHaFA?rs=1&pid=ImgDetMain&o=7&rm=3",
    rating: 4.90,
    review: 292,
    yearOfHostin: 10,
    bedAndBathroom: "1 double bed · Dedicated bathroom",
    date: "Jan 26-29",
    price: 2200,
    address: "San Fernando, La Union",
    vendor: "Maria Santos",
    vendorProfession: "Teacher",
    vendorProfile: "https://cdn.home-designing.com/wp-content/uploads/2017/11/one-room-apartment-design.jpg",
    latitude: 16.6159,
    longitude: 120.3166,
    imageUrls: [
      "https://tse1.mm.bing.net/th/id/OIP.L58zPXmBoGITv0II_nDnAwHaFA?rs=1&pid=ImgDetMain&o=7&rm=3",
      "https://cdn.home-designing.com/wp-content/uploads/2017/11/one-room-apartment-design.jpg",
      "https://decoholic.org/wp-content/uploads/2019/04/small-apartment-design-idea-8.jpg",
      "https://tse1.explicit.bing.net/th/id/OIP.rSp0maHUShJGcrdjs20ETQHaFj?w=1024&h=768&rs=1&pid=ImgDetMain&o=7&rm=3",
      "https://d1hy6t2xeg0mdl.cloudfront.net/image/623004/473be481ff/standard",
    ],
  ),
    Place(
    isActive: true,
    title: "Dorm",
    image: "https://tse1.mm.bing.net/th/id/OIP.L58zPXmBoGITv0II_nDnAwHaFA?rs=1&pid=ImgDetMain&o=7&rm=3",
    rating: 4.20,
    review: 67,
    yearOfHostin: 10,
    bedAndBathroom: "1 double bed · Dedicated bathroom",
    date: "Jan 26-29",
    price: 2200,
    address: "Marilao, Bulacan",
    vendor: "Juan tubol",
    vendorProfession: "Teacher",
    vendorProfile: "https://cdn.home-designing.com/wp-content/uploads/2017/11/one-room-apartment-design.jpg",
    latitude: 14.7724,
    longitude: 120.9600,
    imageUrls: [
      "https://tse1.mm.bing.net/th/id/OIP.L58zPXmBoGITv0II_nDnAwHaFA?rs=1&pid=ImgDetMain&o=7&rm=3",
      "https://cdn.home-designing.com/wp-content/uploads/2017/11/one-room-apartment-design.jpg",
      "https://decoholic.org/wp-content/uploads/2019/04/small-apartment-design-idea-8.jpg",
      "https://tse1.explicit.bing.net/th/id/OIP.rSp0maHUShJGcrdjs20ETQHaFj?w=1024&h=768&rs=1&pid=ImgDetMain&o=7&rm=3",
      "https://d1hy6t2xeg0mdl.cloudfront.net/image/623004/473be481ff/standard",
    ],
  ),
  Place(
    isActive: true,
    title: "Cozy private room in a vibrant neighborhood",
    image: "https://cdn.home-designing.com/wp-content/uploads/2017/11/one-room-apartment-design.jpg",
    rating: 4.75,
    review: 85,
    bedAndBathroom: "1 king bed · Private bathroom",
    date: "Dec 1-5",
    price: 1800,
    address: "Iloilo City, Iloilo",
    vendor: "Jose Rizal",
    vendorProfession: "Software Engineer",
    yearOfHostin: 5,
    vendorProfile: "https://decoholic.org/wp-content/uploads/2019/04/small-apartment-design-idea-8.jpg",
    latitude: 10.7202,
    longitude: 122.5621,
    imageUrls: [
      "https://cdn.home-designing.com/wp-content/uploads/2017/11/one-room-apartment-design.jpg",
      "https://decoholic.org/wp-content/uploads/2019/04/small-apartment-design-idea-8.jpg",
      "https://tse1.explicit.bing.net/th/id/OIP.rSp0maHUShJGcrdjs20ETQHaFj?w=1024&h=768&rs=1&pid=ImgDetMain&o=7&rm=3",
      "https://d1hy6t2xeg0mdl.cloudfront.net/image/623004/473be481ff/standard",
      "https://tse1.mm.bing.net/th/id/OIP.L58zPXmBoGITv0II_nDnAwHaFA?rs=1&pid=ImgDetMain&o=7&rm=3",
    ],
  ),
  Place(
    isActive: true,
    title: "Studio apartment with a stunning view",
    image: "https://decoholic.org/wp-content/uploads/2019/04/small-apartment-design-idea-8.jpg",
    rating: 4.95,
    review: 420,
    bedAndBathroom: "1 queen bed · Private bathroom",
    date: "Nov 20-25",
    price: 2500,
    address: "Tagaytay, Cavite",
    vendor: "Sofia Reyes",
    vendorProfession: "Architect",
    yearOfHostin: 8,
    vendorProfile: "https://tse1.explicit.bing.net/th/id/OIP.rSp0maHUShJGcrdjs20ETQHaFj?w=1024&h=768&rs=1&pid=ImgDetMain&o=7&rm=3",
    latitude: 14.0953,
    longitude: 120.9383,
    imageUrls: [
      "https://decoholic.org/wp-content/uploads/2019/04/small-apartment-design-idea-8.jpg",
      "https://tse1.explicit.bing.net/th/id/OIP.rSp0maHUShJGcrdjs20ETQHaFj?w=1024&h=768&rs=1&pid=ImgDetMain&o=7&rm=3",
      "https://d1hy6t2xeg0mdl.cloudfront.net/image/623004/473be481ff/standard",
      "https://tse1.mm.bing.net/th/id/OIP.L58zPXmBoGITv0II_nDnAwHaFA?rs=1&pid=ImgDetMain&o=7&rm=3",
      "https://cdn.home-designing.com/wp-content/uploads/2017/11/one-room-apartment-design.jpg",
    ],
  ),
  Place(
    isActive: false,
    title: "Charming cottage near the lake",
    image: "https://tse1.explicit.bing.net/th/id/OIP.rSp0maHUShJGcrdjs20ETQHaFj?w=1024&h=768&rs=1&pid=ImgDetMain&o=7&rm=3",
    rating: 4.60,
    review: 150,
    bedAndBathroom: "2 double beds · Shared bathroom",
    date: "Jan 10-15",
    price: 2000,
    address: "Lake Sebu, South Cotabato",
    vendor: "Andres Bonifacio",
    vendorProfession: "Photographer",
    yearOfHostin: 3,
    vendorProfile: "https://d1hy6t2xeg0mdl.cloudfront.net/image/623004/473be481ff/standard",
    latitude: 6.2258,
    longitude: 124.6934,
    imageUrls: [
      "https://tse1.explicit.bing.net/th/id/OIP.rSp0maHUShJGcrdjs20ETQHaFj?w=1024&h=768&rs=1&pid=ImgDetMain&o=7&rm=3",
      "https://d1hy6t2xeg0mdl.cloudfront.net/image/623004/473be481ff/standard",
      "https://tse1.mm.bing.net/th/id/OIP.L58zPXmBoGITv0II_nDnAwHaFA?rs=1&pid=ImgDetMain&o=7&rm=3",
      "https://cdn.home-designing.com/wp-content/uploads/2017/11/one-room-apartment-design.jpg",
      "https://decoholic.org/wp-content/uploads/2019/04/small-apartment-design-idea-8.jpg",
    ],
  ),
];
