// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:placeme/Provider/favorite_provider.dart';
// import 'package:placeme/pages/place_detail_screen.dart';
// import 'another_carousel.dart';

// class DisplayPlaces extends StatefulWidget {
//   const DisplayPlaces({super.key});

//   @override
//   State<DisplayPlaces> createState() => _DisplayPlacesState();
// }

// class _DisplayPlacesState extends State<DisplayPlaces> {
//   final CollectionReference placeCollection = FirebaseFirestore.instance
//       .collection("myAppCpollection");

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final provider = FavoriteProvider.of(context);
//     return StreamBuilder<QuerySnapshot>(
//       stream: placeCollection.snapshots(),
//       builder: (context, streamSnapshot) {
//         if (streamSnapshot.hasData) {
//           final docs = streamSnapshot.data!.docs;

//           return ListView.builder(
//             padding: EdgeInsets.zero,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: docs.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               final place = docs[index];
//               final data = place.data();
//               final mapData = data is Map<String, dynamic>
//                   ? data
//                   : <String, dynamic>{};
//               final isActive = mapData['isActive'] == true;
//               final List<String> imageUrls = (mapData['imageUrls'] is List)
//                   ? List<String>.from(mapData['imageUrls'].whereType<String>())
//                   : [];
//               final ownerImage = mapData['Owner'] is String
//                   ? mapData['Owner']
//                   : null;
//               final imageProviders = imageUrls
//                   .map((url) => NetworkImage(url))
//                   .toList();
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => PlaceDetailScreen(place: place),
//                       ),
//                     );
//                   },
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Stack(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(15),
//                             child: SizedBox(
//                               height: 370,
//                               width: double.infinity,
//                               child: AnotherCarousel(
//                                 images: imageProviders,
//                                 dotSize: 6,
//                                 indicatorBgPadding: 5,
//                                 dotBgColor: Colors.transparent,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             top: 20,
//                             left: 15,
//                             right: 15,
//                             child: Row(
//                               children: [
//                                 isActive
//                                     ? Container(
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.circular(
//                                             40,
//                                           ),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                             horizontal: 15,
//                                             vertical: 5,
//                                           ),
//                                           child: const Text(
//                                             "Available",
//                                             style: TextStyle(
//                                               color: Colors.green,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     : SizedBox(
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                             0.03,
//                                       ),
//                                 const Spacer(),
//                                 Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     const Icon(
//                                       Icons.favorite_outline_rounded,
//                                       size: 34,
//                                       color: Colors.white,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         provider.toggleFavorite(place);
//                                       },
//                                       child: const Icon(
//                                         Icons.favorite,
//                                         size: 30,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           vendorProfie(ownerImage),
//                         ],
//                       ),
//                       SizedBox(height: size.height * 0.01),
//                       Row(
//                         children: [
//                           Text(
//                             place['address'],
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const Spacer(),
//                           const Icon(Icons.star),
//                           const SizedBox(width: 5),
//                           Text(place['rating'].toString()),
//                         ],
//                       ),
//                       Text(
//                         "Stay with ${place['vendor']} . ${place['vendorProfession']}",
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Text(
//                         place['date'],
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.007),
//                       RichText(
//                         text: TextSpan(
//                           text: "₱${place['price']}",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             fontSize: 16,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: " /Month",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.03),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         }

//         if (streamSnapshot.hasError) {
//           return Center(child: Text("Error: ${streamSnapshot.error}"));
//         }

//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }

//   Positioned vendorProfie(ownerImage) {
//     return Positioned(
//       bottom: 11,
//       left: 10,
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(15),
//               bottomRight: Radius.circular(15),
//             ),
//             child: Image.asset(
//               "assets/images/book_cover.png",
//               height: 60,
//               width: 60,
//               fit: BoxFit.cover,
//             ),
//           ),
//           if (ownerImage != null)
//             Positioned(
//               top: 10,
//               left: 10,
//               child: CircleAvatar(backgroundImage: NetworkImage(ownerImage)),
//             )
//           else
//             Positioned(
//               top: 10,
//               left: 10,
//               child: const CircleAvatar(
//                 backgroundImage: AssetImage('assets/images/default_avatar.png'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:placeme/Provider/favorite_provider.dart';
// import 'package:placeme/pages/place_detail_screen.dart';
// import 'package:provider/provider.dart';
// import 'another_carousel.dart';

// class DisplayPlaces extends StatefulWidget {
//   const DisplayPlaces({super.key});

//   @override
//   State<DisplayPlaces> createState() => _DisplayPlacesState();
// }

// class _DisplayPlacesState extends State<DisplayPlaces> {
//   final CollectionReference placeCollection = FirebaseFirestore.instance
//       .collection("myAppCpollection");

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return StreamBuilder<QuerySnapshot>(
//       stream: placeCollection.snapshots(),
//       builder: (context, streamSnapshot) {
//         if (streamSnapshot.hasData) {
//           final docs = streamSnapshot.data!.docs;

//           return ListView.builder(
//             padding: EdgeInsets.zero,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: docs.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               final place = docs[index];
//               final data = place.data();
//               final mapData = data is Map<String, dynamic>
//                   ? data
//                   : <String, dynamic>{};
//               final isActive = mapData['isActive'] == true;
//               final List<String> imageUrls = (mapData['imageUrls'] is List)
//                   ? List<String>.from(mapData['imageUrls'].whereType<String>())
//                   : [];
//               final ownerImage = mapData['Owner'] is String
//                   ? mapData['Owner']
//                   : null;
//               final imageProviders = imageUrls
//                   .map((url) => NetworkImage(url))
//                   .toList();

//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => PlaceDetailScreen(place: place),
//                       ),
//                     );
//                   },
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Stack(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(15),
//                             child: SizedBox(
//                               height: 370,
//                               width: double.infinity,
//                               child: AnotherCarousel(
//                                 images: imageProviders,
//                                 dotSize: 6,
//                                 indicatorBgPadding: 5,
//                                 dotBgColor: Colors.transparent,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             top: 20,
//                             left: 15,
//                             right: 15,
//                             child: Row(
//                               children: [
//                                 isActive
//                                     ? Container(
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.circular(
//                                             40,
//                                           ),
//                                         ),
//                                         child: const Padding(
//                                           padding: EdgeInsets.symmetric(
//                                             horizontal: 15,
//                                             vertical: 5,
//                                           ),
//                                           child: Text(
//                                             "Available",
//                                             style: TextStyle(
//                                               color: Colors.green,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     : SizedBox(
//                                         width:
//                                             MediaQuery.of(context).size.width * 
//                                             0.03,
//                                       ),
//                                 const Spacer(),
//                                 Consumer<FavoriteProvider>(
//                                 builder: (context, favoriteProvider, child) {
//                                   final isFavorite = favoriteProvider.isExist(place);
//                                   return Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.favorite_outline_rounded,
//                                         size: 34,
//                                         color: Colors.white,
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           favoriteProvider.toggleFavorite(place);
//                                         },
//                                         child: Icon(
//                                           isFavorite ? Icons.favorite : Icons.favorite_border,
//                                           size: 30,
//                                           color: isFavorite ? Colors.red : Colors.black,
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                                 // Consumer<FavoriteProvider>(
//                                 //   builder: (context, favoriteProvider, child) {
//                                 //     return Stack(
//                                 //       alignment: Alignment.center,
//                                 //       children: [
//                                 //         Icon(
//                                 //           Icons.favorite_outline_rounded,
//                                 //           size: 34,
//                                 //           color: Colors.white,
//                                 //         ),
//                                 //         InkWell(
//                                 //         onTap: () {
//                                 //           favoriteProvider.toggleFavorite(place);
//                                 //         },
//                                 //         child: Icon(
//                                 //           isFavorite ? Icons.favorite : Icons.favorite_border,
//                                 //           size: 30,
//                                 //           color: isFavorite ? Colors.red : Colors.black,
//                                 //         ),
//                                 //       ),
//                                 //       ],
//                                 //     );
//                                 //   },
//                                 // ),
//                               ],
//                             ),
//                           ),
//                           vendorProfile(ownerImage),
//                         ],
//                       ),
//                       SizedBox(height: size.height * 0.01),
//                       Row(
//                         children: [
//                           Text(
//                             place['address'],
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const Spacer(),
//                           const Icon(Icons.star),
//                           const SizedBox(width: 5),
//                           Text(place['rating'].toString()),
//                         ],
//                       ),
//                       Text(
//                         "Stay with ${place['vendor']} . ${place['vendorProfession']}",
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Text(
//                         place['date'],
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.007),
//                       RichText(
//                         text: TextSpan(
//                           text: "₱${place['price']}",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             fontSize: 16,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: " /Month",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.03),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         }

//         if (streamSnapshot.hasError) {
//           return Center(child: Text("Error: ${streamSnapshot.error}"));
//         }

//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }

//   // FIXED: Typo in method name
//   Positioned vendorProfile(String? ownerImage) {
//     return Positioned(
//       bottom: 11,
//       left: 10,
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(15),
//               bottomRight: Radius.circular(15),
//             ),
//             child: Image.asset(
//               "assets/images/book_cover.png",
//               height: 60,
//               width: 60,
//               fit: BoxFit.cover,
//             ),
//           ),
//           if (ownerImage != null)
//             Positioned(
//               top: 10,
//               left: 10,
//               child: CircleAvatar(backgroundImage: NetworkImage(ownerImage)),
//             )
//           else
//             const Positioned(
//               top: 10,
//               left: 10,
//               child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/images/default_avatar.png'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:placeme/Provider/favorite_provider.dart';
// import 'package:placeme/pages/place_detail_screen.dart';
// import 'package:placeme/Components/search_bar_and_filter.dart';
// import 'package:provider/provider.dart';
// import 'another_carousel.dart';

// class DisplayPlaces extends StatefulWidget {
//   final String? searchQuery;
//   final FilterOptions? filters;

//   const DisplayPlaces({
//     super.key,
//     this.searchQuery,
//     this.filters,
//   });

//   @override
//   State<DisplayPlaces> createState() => _DisplayPlacesState();
// }

// class _DisplayPlacesState extends State<DisplayPlaces> {
//   final CollectionReference placeCollection = FirebaseFirestore.instance
//       .collection("myAppCpollection");

//   List<QueryDocumentSnapshot> _filterPlaces(List<QueryDocumentSnapshot> docs) {
//     return docs.where((doc) {
//       final data = doc.data() as Map<String, dynamic>;
      
//       if (widget.searchQuery != null && widget.searchQuery!.isNotEmpty) {
//         final query = widget.searchQuery!.toLowerCase();
//         final address = (data['address'] ?? '').toString().toLowerCase();
//         final title = (data['title'] ?? '').toString().toLowerCase();
//         final vendor = (data['vendor'] ?? '').toString().toLowerCase();
        
//         if (!address.contains(query) && 
//             !title.contains(query) && 
//             !vendor.contains(query)) {
//           return false;
//         }
//       }
      
//       if (widget.filters != null) {
//         final price = (data['price'] ?? 0).toDouble();
//         if (price < widget.filters!.priceRange.start || 
//             price > widget.filters!.priceRange.end) {
//           return false;
//         }
        
//         if (widget.filters!.selectedLocations.isNotEmpty) {
//           final address = (data['address'] ?? '').toString();
//           bool matchesLocation = false;
//           for (var location in widget.filters!.selectedLocations) {
//             if (address.contains(location)) {
//               matchesLocation = true;
//               break;
//             }
//           }
//           if (!matchesLocation) return false;
//         }
        
//         if (widget.filters!.selectedBedBathroom.isNotEmpty) {
//           final bedBathroom = (data['bedAndBathroom'] ?? '').toString();
//           if (!widget.filters!.selectedBedBathroom.contains(bedBathroom)) {
//             return false;
//           }
//         }
        
//         if (widget.filters!.selectedRating != null) {
//           final rating = (data['rating'] ?? 0).toDouble();
//           if (rating < widget.filters!.selectedRating!) {
//             return false;
//           }
//         }
//       }
      
//       return true;
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return StreamBuilder<QuerySnapshot>(
//       stream: placeCollection.snapshots(),
//       builder: (context, streamSnapshot) {
//         if (streamSnapshot.hasData) {
//           final allDocs = streamSnapshot.data!.docs;
//           final filteredDocs = _filterPlaces(allDocs);

//           List<QueryDocumentSnapshot> docsToDisplay;
          
//           if (filteredDocs.isEmpty) {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   elevation: 0,
//                   content: Text('No places found matching your criteria.'),
//                   backgroundColor: Color(0xFF20B2AA),
//                   behavior: SnackBarBehavior.floating,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   margin: EdgeInsets.only(
//                     bottom: MediaQuery.of(context).size.height - 680,
//                     left: 10,
//                     right: 10,
//                   ),
//                   duration: Duration(seconds: 2),
//                 ),
//               );
//             });
//             docsToDisplay = allDocs;
//           } else {
//             docsToDisplay = filteredDocs;
//           }

//           return ListView.builder(
//             padding: EdgeInsets.zero,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: docsToDisplay.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               final place = docsToDisplay[index];
//               final data = place.data();
//               final mapData = data is Map<String, dynamic>
//                   ? data
//                   : <String, dynamic>{};
//               final isActive = mapData['isActive'] == true;
//               final List<String> imageUrls = (mapData['imageUrls'] is List)
//                   ? List<String>.from(mapData['imageUrls'].whereType<String>())
//                   : [];
//               final ownerImage = mapData['Owner'] is String
//                   ? mapData['Owner']
//                   : null;
//               final imageProviders = imageUrls
//                   .map((url) => NetworkImage(url))
//                   .toList();

//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => PlaceDetailScreen(place: place),
//                       ),
//                     );
//                   },
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Stack(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(15),
//                             child: SizedBox(
//                               height: 370,
//                               width: double.infinity,
//                               child: AnotherCarousel(
//                                 images: imageProviders,
//                                 dotSize: 6,
//                                 indicatorBgPadding: 5,
//                                 dotBgColor: Colors.transparent,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             top: 20,
//                             left: 15,
//                             right: 15,
//                             child: Row(
//                               children: [
//                                 isActive
//                                     ? Container(
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.circular(
//                                             40,
//                                           ),
//                                         ),
//                                         child: const Padding(
//                                           padding: EdgeInsets.symmetric(
//                                             horizontal: 15,
//                                             vertical: 5,
//                                           ),
//                                           child: Text(
//                                             "Available",
//                                             style: TextStyle(
//                                               color: Colors.green,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     : SizedBox(
//                                         width:
//                                             MediaQuery.of(context).size.width * 
//                                             0.03,
//                                       ),
//                                 const Spacer(),
//                                 Consumer<FavoriteProvider>(
//                                 builder: (context, favoriteProvider, child) {
//                                   final isFavorite = favoriteProvider.isExist(place);
//                                   return Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.favorite_outline_rounded,
//                                         size: 34,
//                                         color: Colors.white,
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           favoriteProvider.toggleFavorite(place);
//                                         },
//                                         child: Icon(
//                                           isFavorite ? Icons.favorite : Icons.favorite_border,
//                                           size: 30,
//                                           color: isFavorite ? Colors.red : Colors.black,
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                               ],
//                             ),
//                           ),
//                           vendorProfile(ownerImage),
//                         ],
//                       ),
//                       SizedBox(height: size.height * 0.01),
//                       Row(
//                         children: [
//                           Text(
//                             place['address'],
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const Spacer(),
//                           const Icon(Icons.star),
//                           const SizedBox(width: 5),
//                           Text(place['rating'].toString()),
//                         ],
//                       ),
//                       Text(
//                         "Stay with ${place['vendor']} . ${place['vendorProfession']}",
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Text(
//                         place['date'],
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.007),
//                       RichText(
//                         text: TextSpan(
//                           text: "₱${place['price']}",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             fontSize: 16,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: " /Month",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.03),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         }

//         if (streamSnapshot.hasError) {
//           return Center(child: Text("Error: ${streamSnapshot.error}"));
//         }

//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }

//   Positioned vendorProfile(String? ownerImage) {
//     return Positioned(
//       bottom: 11,
//       left: 10,
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(15),
//               bottomRight: Radius.circular(15),
//             ),
//             child: Image.asset(
//               "assets/images/book_cover.png",
//               height: 60,
//               width: 60,
//               fit: BoxFit.cover,
//             ),
//           ),
//           if (ownerImage != null)
//             Positioned(
//               top: 10,
//               left: 10,
//               child: CircleAvatar(backgroundImage: NetworkImage(ownerImage)),
//             )
//           else
//             const Positioned(
//               top: 10,
//               left: 10,
//               child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/images/default_avatar.png'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:placeme/Provider/favorite_provider.dart';
// import 'package:placeme/pages/place_detail_screen.dart';
// import 'package:placeme/Components/search_bar_and_filter.dart';
// import 'package:provider/provider.dart';
// import 'another_carousel.dart';

// class DisplayPlaces extends StatefulWidget {
//   final String? searchQuery;
//   final FilterOptions? filters;

//   const DisplayPlaces({
//     super.key,
//     this.searchQuery,
//     this.filters,
//   });

//   @override
//   State<DisplayPlaces> createState() => _DisplayPlacesState();
// }

// class _DisplayPlacesState extends State<DisplayPlaces> {
//   final CollectionReference placeCollection = FirebaseFirestore.instance
//       .collection("myAppCpollection");
//   bool _hasShownNoResultsMessage = false;

//   @override
//   void didUpdateWidget(DisplayPlaces oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.searchQuery != widget.searchQuery || 
//         oldWidget.filters != widget.filters) {
//       _hasShownNoResultsMessage = false;
//     }
//   }

//   List<QueryDocumentSnapshot> _filterPlaces(List<QueryDocumentSnapshot> docs) {
//     return docs.where((doc) {
//       final data = doc.data() as Map<String, dynamic>;
      
//       if (widget.searchQuery != null && widget.searchQuery!.isNotEmpty) {
//         final query = widget.searchQuery!.toLowerCase();
//         final address = (data['address'] ?? '').toString().toLowerCase();
//         final title = (data['title'] ?? '').toString().toLowerCase();
//         final vendor = (data['vendor'] ?? '').toString().toLowerCase();
        
//         if (!address.contains(query) && 
//             !title.contains(query) && 
//             !vendor.contains(query)) {
//           return false;
//         }
//       }
      
//       if (widget.filters != null) {
//         final price = (data['price'] ?? 0).toDouble();
//         if (price < widget.filters!.priceRange.start || 
//             price > widget.filters!.priceRange.end) {
//           return false;
//         }
        
//         if (widget.filters!.showOnlyActive) {
//           if (data['isActive'] != true) {
//             return false;
//             }
//           }
        
//         if (widget.filters!.selectedLocations.isNotEmpty) {
//           final address = (data['address'] ?? '').toString();
//           bool matchesLocation = false;
//           for (var location in widget.filters!.selectedLocations) {
//             if (address.contains(location)) {
//               matchesLocation = true;
//               break;
//             }
//           }
//           if (!matchesLocation) return false;
//         }
        
//         if (widget.filters!.selectedBedBathroom.isNotEmpty) {
//           final bedBathroom = (data['bedAndBathroom'] ?? '').toString();
//           if (!widget.filters!.selectedBedBathroom.contains(bedBathroom)) {
//             return false;
//           }
//         }
        
//         if (widget.filters!.selectedRating != null) {
//           final rating = (data['rating'] ?? 0).toDouble();
//           if (rating < widget.filters!.selectedRating!) {
//             return false;
//           }
//         }
//       }
      
//       return true;
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return StreamBuilder<QuerySnapshot>(
//       stream: placeCollection.snapshots(),
//       builder: (context, streamSnapshot) {
//         if (streamSnapshot.hasData) {
//           final allDocs = streamSnapshot.data!.docs;
//           final filteredDocs = _filterPlaces(allDocs);

//           List<QueryDocumentSnapshot> docsToDisplay;
          
//           if (filteredDocs.isEmpty) {
//             if (!_hasShownNoResultsMessage) {
//               _hasShownNoResultsMessage = true;
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     elevation: 0,
//                     content: Text('No places found matching your criteria.'),
//                     backgroundColor: Color(0xFF20B2AA),
//                     behavior: SnackBarBehavior.floating,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     margin: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).size.height - 680,
//                       left: 10,
//                       right: 10,
//                     ),
//                     duration: Duration(seconds: 2),
//                   ),
//                 );
//               });
//             }
//             docsToDisplay = allDocs;
//           } else {
//             docsToDisplay = filteredDocs;
//           }

//           return ListView.builder(
//             padding: EdgeInsets.zero,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: docsToDisplay.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               final place = docsToDisplay[index];
//               final data = place.data();
//               final mapData = data is Map<String, dynamic>
//                   ? data
//                   : <String, dynamic>{};
//               final isActive = mapData['isActive'] == true;
//               final List<String> imageUrls = (mapData['imageUrls'] is List)
//                   ? List<String>.from(mapData['imageUrls'].whereType<String>())
//                   : [];
//               final ownerImage = mapData['Owner'] is String
//                   ? mapData['Owner']
//                   : null;
//               final imageProviders = imageUrls
//                   .map((url) => NetworkImage(url))
//                   .toList();

//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => PlaceDetailScreen(place: place),
//                       ),
//                     );
//                   },
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Stack(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(15),
//                             child: SizedBox(
//                               height: 370,
//                               width: double.infinity,
//                               child: AnotherCarousel(
//                                 images: imageProviders,
//                                 dotSize: 6,
//                                 indicatorBgPadding: 5,
//                                 dotBgColor: Colors.transparent,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             top: 20,
//                             left: 15,
//                             right: 15,
//                             child: Row(
//                               children: [
//                                 isActive
//                                     ? Container(
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.circular(
//                                             40,
//                                           ),
//                                         ),
//                                         child: const Padding(
//                                           padding: EdgeInsets.symmetric(
//                                             horizontal: 15,
//                                             vertical: 5,
//                                           ),
//                                           child: Text(
//                                             "Available",
//                                             style: TextStyle(
//                                               color: Colors.green,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     : SizedBox(
//                                         width:
//                                             MediaQuery.of(context).size.width * 
//                                             0.03,
//                                       ),
//                                 const Spacer(),
//                                 Consumer<FavoriteProvider>(
//                                 builder: (context, favoriteProvider, child) {
//                                   final isFavorite = favoriteProvider.isExist(place);
//                                   return Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.favorite_outline_rounded,
//                                         size: 34,
//                                         color: Colors.white,
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           favoriteProvider.toggleFavorite(place);
//                                         },
//                                         child: Icon(
//                                           isFavorite ? Icons.favorite : Icons.favorite_border,
//                                           size: 30,
//                                           color: isFavorite ? Colors.red : Colors.black,
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                               ],
//                             ),
//                           ),
//                           vendorProfile(ownerImage),
//                         ],
//                       ),
//                       SizedBox(height: size.height * 0.01),
//                       Row(
//                         children: [
//                           Text(
//                             place['address'],
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const Spacer(),
//                           const Icon(Icons.star),
//                           const SizedBox(width: 5),
//                           Text(place['rating'].toString()),
//                         ],
//                       ),
//                       Text(
//                         "Stay with ${place['vendor']} . ${place['vendorProfession']}",
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Text(
//                         place['date'],
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.007),
//                       RichText(
//                         text: TextSpan(
//                           text: "₱${place['price']}",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             fontSize: 16,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: " /Month",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.03),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         }

//         if (streamSnapshot.hasError) {
//           return Center(child: Text("Error: ${streamSnapshot.error}"));
//         }

//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }

//   Positioned vendorProfile(String? ownerImage) {
//     return Positioned(
//       bottom: 11,
//       left: 10,
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(15),
//               bottomRight: Radius.circular(15),
//             ),
//             child: Image.asset(
//               "assets/images/book_cover.png",
//               height: 60,
//               width: 60,
//               fit: BoxFit.cover,
//             ),
//           ),
//           if (ownerImage != null)
//             Positioned(
//               top: 10,
//               left: 10,
//               child: CircleAvatar(backgroundImage: NetworkImage(ownerImage)),
//             )
//           else
//             const Positioned(
//               top: 10,
//               left: 10,
//               child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/images/default_avatar.png'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:placeme/Provider/favorite_provider.dart';
import 'package:placeme/model/filter_options.dart';
import 'package:placeme/pages/place_detail_screen.dart';
import 'package:provider/provider.dart';
import 'another_carousel.dart';

class DisplayPlaces extends StatefulWidget {
  final String? searchQuery;
  final FilterOptions filters;

  const DisplayPlaces({
    super.key,
    this.searchQuery,
    required this.filters,
  });

  @override
  State<DisplayPlaces> createState() => _DisplayPlacesState();
}

class _DisplayPlacesState extends State<DisplayPlaces> {
  final CollectionReference placeCollection =
      FirebaseFirestore.instance.collection("myAppCpollection");

  List<QueryDocumentSnapshot> _filterPlaces(List<QueryDocumentSnapshot> docs) {
    return docs.where((doc) {
      final data = doc.data() as Map<String, dynamic>;

      if (widget.searchQuery != null && widget.searchQuery!.isNotEmpty) {
        final query = widget.searchQuery!.toLowerCase();
        final address = (data['address'] ?? '').toString().toLowerCase();
        final title = (data['title'] ?? '').toString().toLowerCase();
        final vendor = (data['vendor'] ?? '').toString().toLowerCase();

        if (!address.contains(query) &&
            !title.contains(query) &&
            !vendor.contains(query)) {
          return false;
        }
      }

      final price = (data['price'] ?? 0).toDouble();
      if (price < widget.filters.priceRange.start ||
          price > widget.filters.priceRange.end) {
        return false;
      }

      if (widget.filters.showOnlyActive) {
        if (data['isActive'] != true) {
          return false;
        }
      }

      if (widget.filters.selectedLocations.isNotEmpty) {
        final address = (data['address'] ?? '').toString();
        bool matchesLocation = false;
        for (var location in widget.filters.selectedLocations) {
          if (address.contains(location)) {
            matchesLocation = true;
            break;
          }
        }
        if (!matchesLocation) return false;
      }

      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: placeCollection.snapshots(),
      builder: (context, streamSnapshot) {
        if (streamSnapshot.hasData) {
          final allDocs = streamSnapshot.data!.docs;
          final filteredDocs = _filterPlaces(allDocs);

          if (filteredDocs.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'No places found',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Try adjusting your search or filters',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredDocs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final place = filteredDocs[index];
              final data = place.data();
              final mapData =
                  data is Map<String, dynamic> ? data : <String, dynamic>{};
              final isActive = mapData['isActive'] == true;
              final List<String> imageUrls = (mapData['imageUrls'] is List)
                  ? List<String>.from(mapData['imageUrls'].whereType<String>())
                  : [];
              final ownerImage =
                  mapData['Owner'] is String ? mapData['Owner'] : null;
              final imageProviders =
                  imageUrls.map((url) => NetworkImage(url)).toList();

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlaceDetailScreen(place: place),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              height: 370,
                              width: double.infinity,
                              child: AnotherCarousel(
                                images: imageProviders,
                                dotSize: 6,
                                indicatorBgPadding: 5,
                                dotBgColor: Colors.transparent,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 15,
                            right: 15,
                            child: Row(
                              children: [
                                isActive
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 5,
                                          ),
                                          child: Text(
                                            "Available",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                      ),
                                const Spacer(),
                                Consumer<FavoriteProvider>(
                                  builder:
                                      (context, favoriteProvider, child) {
                                    final isFavorite =
                                        favoriteProvider.isExist(place);
                                    return Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Icon(
                                          Icons.favorite_outline_rounded,
                                          size: 34,
                                          color: Colors.white,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            favoriteProvider
                                                .toggleFavorite(place);
                                          },
                                          child: Icon(
                                            isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            size: 30,
                                            color: isFavorite
                                                ? Colors.red
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          vendorProfile(ownerImage),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          Text(
                            place['address'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.star),
                          const SizedBox(width: 5),
                          Text(place['rating'].toString()),
                        ],
                      ),
                      Text(
                        "Stay with ${place['vendor']} . ${place['vendorProfession']}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        place['date'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: size.height * 0.007),
                      RichText(
                        text: TextSpan(
                          text: "₱${place['price']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: " /Month",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                ),
              );
            },
          );
        }

        if (streamSnapshot.hasError) {
          return Center(child: Text("Error: ${streamSnapshot.error}"));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Positioned vendorProfile(String? ownerImage) {
    return Positioned(
      bottom: 11,
      left: 10,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Image.asset(
              "assets/images/book_cover.png",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          if (ownerImage != null)
            Positioned(
              top: 10,
              left: 10,
              child: CircleAvatar(backgroundImage: NetworkImage(ownerImage)),
            )
          else
            const Positioned(
              top: 10,
              left: 10,
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/default_avatar.png'),
              ),
            ),
        ],
      ),
    );
  }
}
