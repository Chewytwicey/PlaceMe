// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:placeme/Components/another_carousel.dart';
// import 'package:placeme/Components/location_in_map.dart';
// import 'package:placeme/Components/my_icon_button.dart';
// import 'package:placeme/Components/star_rating.dart';
// import 'package:placeme/provider/favorite_provider.dart';

// class PlaceDetailScreen extends StatefulWidget {
//   final QueryDocumentSnapshot<Object?> place;
//   const PlaceDetailScreen({super.key, required this.place});

//   @override
//   State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
// }

// class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
//   int currentIndex = 0;

//   void _openImageViewer(
//     BuildContext context,
//     List<String> imageUrls,
//     int initialIndex,
//   ) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => FullScreenImageViewer(
//           imageUrls: imageUrls,
//           initialIndex: initialIndex,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final provider = FavoriteProvider();
//     return Scaffold(
//       backgroundColor: Color(0xFFF5F5DC),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             detailImageandIcon(size, context, provider),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.place['title'],
//                     maxLines: 2,
//                     style: const TextStyle(
//                       fontSize: 25,
//                       height: 1.2,
//                       fontWeight: FontWeight.bold,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.02),
//                   Text(
//                     "Room in ${widget.place['address']}",
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Text(
//                     widget.place['bedAndBathroom'],
//                     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//                   ),
//                 ],
//               ),
//             ),
//             widget.place['isActive'] == true
//                 ? ratingAndStarTrue()
//                 : ratingAndStarFalse(),
//             SizedBox(height: size.height * 0.02),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Divider(),
//                   placePropertyList(
//                     size,
//                     "https://i.pinimg.com/736x/ce/fc/dd/cefcddf44953de9667944a9bf4783783.jpg",
//                     "This is a rare find",
//                     "${widget.place['vendor']}'s place is usually fully booked.",
//                   ),
//                   const Divider(),
//                   placePropertyList(
//                     size,
//                     widget.place['vendorProfile'],
//                     "Stay with ${widget.place['vendor']}",
//                     "Superhost · ${widget.place['yearOfHostin']} years hosting",
//                   ),
//                   const Divider(),
//                   placePropertyList(
//                     size,
//                     "https://i.pinimg.com/736x/ce/fc/dd/cefcddf44953de9667944a9bf4783783.jpg",
//                     "Room in a rental unit",
//                     "Your own room in a home, plus access to shared spaces.",
//                   ),
//                   placePropertyList(
//                     size,
//                     "https://i.pinimg.com/736x/ce/fc/dd/cefcddf44953de9667944a9bf4783783.jpg",
//                     "Shared common spaces",
//                     "You'll share parts of the home with the host.",
//                   ),
//                   placePropertyList(
//                     size,
//                     "https://i.pinimg.com/736x/ce/fc/dd/cefcddf44953de9667944a9bf4783783.jpg",
//                     "Shared bathroom",
//                     "You'll share the bathroom with others.",
//                   ),
//                   const Divider(),
//                   SizedBox(height: size.height * 0.02),
//                   const Text(
//                     "About this place",
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                   const Text(
//                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Enim praesent elementum facilisis leo vel fringilla est. Sit amet risus nullam eget felis eget. Gravida dictum fusce ut placerat orci nulla.",
//                     style: TextStyle(fontSize: 16, height: 1.5),
//                   ),
//                   const Divider(),
//                   const Text(
//                     "where you'll be",
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     widget.place['address'],
//                     style: const TextStyle(fontSize: 18, height: 1.5),
//                   ),
//                   SizedBox(
//                     height: 400,
//                     width: size.width,
//                     child: LocationInMap(
//                       place: widget.place as DocumentSnapshot<Object>,
//                     ),
//                   ),
//                   const SizedBox(height: 100),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomSheet: priceAndReservation(size),
//     );
//   }

//   // Container priceAndReservation(Size size) {
//   //   return Container(
//   //     height: size.height * 0.1,
//   //     decoration: BoxDecoration(
//   //       color: Colors.white,
//   //       border: Border.all(color: Colors.black),
//   //     ),
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.center,
//   //       children: [
//   //         Column(
//   //           mainAxisAlignment: MainAxisAlignment.center,
//   //           children: [
//   //             // RichText(
//   //             //   text: TextSpan(
//   //             //     text: "\$${widget.place['price']}",
//   //             //     style: const TextStyle(
//   //             //       fontWeight: FontWeight.bold,
//   //             //       fontSize: 20,
//   //             //       color: Colors.black,
//   //             //     ),
//   //             //     children: const [
//   //             //       TextSpan(
//   //             //         text: " / night",
//   //             //         style: TextStyle(
//   //             //           fontWeight: FontWeight.normal,
//   //             //           fontSize: 16,
//   //             //         ),
//   //             //       ),
//   //             //     ],
//   //             //   ),
//   //             // ),
//   //             // Text(
//   //             //   widget.place['date'],
//   //             //   style: const TextStyle(
//   //             //     fontSize: 16,
//   //             //     fontWeight: FontWeight.bold,
//   //             //     decoration: TextDecoration.underline,
//   //             //   ),
//   //             // ),
//   //           ],
//   //         ),
//   //         SizedBox(
//   //           width: size.width * 0.3,
//   //         ),
//   //         Container(
//   //           alignment: Alignment.center, // <-- centers the child
//   //           padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
//   //           decoration: BoxDecoration(
//   //             color: Color(0xFF20B2AA),
//   //             borderRadius: BorderRadius.circular(15),
//   //           ),
//   //           child: const Text(
//   //             "Inquire",
//   //             textAlign: TextAlign.center,
//   //             style: TextStyle(
//   //               color: Color(0xFFF5F5DC),
//   //               fontSize: 20,
//   //               fontWeight: FontWeight.bold,
//   //             ),
//   //           ),
//   //         )
//   //       ],
//   //     ),
//   //   );
//   // }

//   Container priceAndReservation(Size size) {
//     return Container(
//       height: size.height * 0.1,
//       decoration: BoxDecoration(color: Color(0xFFF5F5DC)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Column(mainAxisAlignment: MainAxisAlignment.center),
//           Spacer(),
//           Container(
//             alignment: Alignment.center,
//             padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
//             decoration: BoxDecoration(
//               color: Color(0xFF20B2AA),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: const Text(
//               "Inquire Now!",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Color(0xFFF5F5DC),
//                 fontSize: 17,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Spacer(),
//         ],
//       ),
//     );
//   }

//   Padding placePropertyList(Size size, image, title, subtitle) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 15),
//       child: Row(
//         children: [
//           Divider(),
//           CircleAvatar(
//             backgroundColor: Colors.white,
//             backgroundImage: NetworkImage(image),
//             radius: 29,
//           ),
//           SizedBox(width: size.width * 0.05),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 19,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   subtitle,
//                   softWrap: true,
//                   overflow: TextOverflow.visible,
//                   style: TextStyle(
//                     fontSize: size.width * 0.05,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Padding ratingAndStarFalse() => Padding(
//     padding: EdgeInsets.symmetric(horizontal: 25),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Icon(Icons.star),
//         const SizedBox(width: 5),
//         Text(
//           "${widget.place['rating'].toString()} — ",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//         ),
//         Text(
//           "${widget.place['review'].toString()} Reviews",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             decoration: TextDecoration.underline,
//           ),
//         ),
//       ],
//     ),
//   );

//   Container ratingAndStarTrue() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
//       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             children: [
//               Text(
//                 widget.place['rating'].toString(),
//                 style: const TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                   height: 1,
//                 ),
//               ),
//               StarRating(rating: widget.place['rating']),
//             ],
//           ),
//           Stack(
//             children: [
//               Image.network(
//                 "https://wallpapers.com/images/high/golden-laurel-wreath-graphic-xvycylskve2cfs0j-xvycylskve2cfs0j.png",
//                 height: 50,
//                 width: 60,
//                 color: Colors.amber,
//               ),
//               const Positioned(
//                 child: Text(
//                   "  Guest\nFavorite",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     height: 1.2,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               Text(
//                 widget.place['review'].toString(),
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
//               ),
//               const Text(
//                 "Reviews",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Stack detailImageandIcon(Size size, BuildContext context, provider) {
//     List<String> imageUrls = List<String>.from(widget.place['imageUrls']);

//     return Stack(
//       children: [
//         GestureDetector(
//           onTap: () {
//             _openImageViewer(context, imageUrls, currentIndex);
//           },
//           child: SizedBox(
//             height: size.height * 0.35,
//             child: AnotherCarousel(
//               images: widget.place['imageUrls']
//                   .map<NetworkImage>((url) => NetworkImage(url))
//                   .toList(),
//               showIndicator: false,
//               dotBgColor: Colors.transparent,
//               onImageChange: (index) {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//               autoplay: false,
//               boxfit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 10,
//           right: 20,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.black54,
//             ),
//             child: Text(
//               "${currentIndex + 1} / ${widget.place['imageUrls'].length}",
//               style: TextStyle(color: Colors.white, fontSize: 16),
//             ),
//           ),
//         ),
//         Positioned(
//           right: 0,
//           left: 0,
//           top: 25,
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: const MyIconButton(icon: Icons.arrow_back_ios_new),
//                 ),
//                 Row(
//                   children: [
//                     const MyIconButton(icon: Icons.share_outlined),
//                     const SizedBox(width: 20),
//                     InkWell(
//                       onTap: () {
//                         provider.toggleFavorite(widget.place);
//                       },
//                       child: MyIconButton(
//                         icon: provider.isExist(widget.place)
//                             ? Icons.favorite
//                             : Icons.favorite_border,
//                         iconColor: provider.isExist(widget.place)
//                             ? Colors.red
//                             : Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class FullScreenImageViewer extends StatefulWidget {
//   final List<String> imageUrls;
//   final int initialIndex;
//   const FullScreenImageViewer({
//     super.key,
//     required this.imageUrls,
//     this.initialIndex = 0,
//   });
//   @override
//   State<FullScreenImageViewer> createState() => _FullScreenImageViewerState();
// }

// class _FullScreenImageViewerState extends State<FullScreenImageViewer> {
//   late PageController _pageController;
//   late int currentIndex;
//   bool _showAppBar = true;
//   bool _isZoomed = false;
//   @override
//   void initState() {
//     super.initState();
//     currentIndex = widget.initialIndex;
//     _pageController = PageController(initialPage: widget.initialIndex);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _toggleAppBar() {
//     setState(() {
//       _showAppBar = !_showAppBar;
//     });
//   }

//   void _onInteractionStart(ScaleStartDetails details) {
//     if (details.pointerCount > 1) {
//       setState(() {
//         _isZoomed = true;
//       });
//     }
//   }

//   void _onInteractionUpdate(ScaleUpdateDetails details) {
//     if (details.scale > 1.0) {
//       setState(() {
//         _isZoomed = true;
//       });
//     }
//   }

//   void _onInteractionEnd(ScaleEndDetails details) {
//     Future.delayed(Duration(milliseconds: 200), () {
//       if (mounted) {
//         setState(() {
//           _isZoomed = false;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       extendBodyBehindAppBar: true,
//       appBar: _showAppBar
//           ? AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               leading: IconButton(
//                 icon: Icon(Icons.close, color: Colors.white),
//                 onPressed: () => Navigator.pop(context),
//               ),
//               title: Text(
//                 "${currentIndex + 1} / ${widget.imageUrls.length}",
//                 style: TextStyle(color: Colors.white),
//               ),
//               centerTitle: true,
//             )
//           : null,
//       body: GestureDetector(
//         onTap: _toggleAppBar,
//         child: PageView.builder(
//           controller: _pageController,
//           physics: _isZoomed
//               ? NeverScrollableScrollPhysics()
//               : BouncingScrollPhysics(),
//           onPageChanged: (index) {
//             setState(() {
//               currentIndex = index;
//             });
//           },
//           itemCount: widget.imageUrls.length,
//           itemBuilder: (context, index) {
//             return InteractiveViewer(
//               onInteractionStart: _onInteractionStart,
//               onInteractionUpdate: _onInteractionUpdate,
//               onInteractionEnd: _onInteractionEnd,
//               minScale: 1.0,
//               maxScale: 4.0,
//               child: Center(
//                 child: Image.network(
//                   widget.imageUrls[index],
//                   fit: BoxFit.contain,
//                   loadingBuilder: (context, child, loadingProgress) {
//                     if (loadingProgress == null) return child;
//                     return Center(
//                       child: CircularProgressIndicator(
//                         value: loadingProgress.expectedTotalBytes != null
//                             ? loadingProgress.cumulativeBytesLoaded /
//                                   loadingProgress.expectedTotalBytes!
//                             : null,
//                         color: Colors.white,
//                       ),
//                     );
//                   },
//                   errorBuilder: (context, error, stackTrace) {
//                     return Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.error, color: Colors.white, size: 50),
//                           SizedBox(height: 10),
//                           Text(
//                             'Failed to load image',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:placeme/Components/another_carousel.dart';
import 'package:placeme/Components/location_in_map.dart';
import 'package:placeme/Components/my_icon_button.dart';
import 'package:placeme/Components/star_rating.dart';
import 'package:placeme/Provider/favorite_provider.dart';
import 'package:provider/provider.dart'; // Added this import

class PlaceDetailScreen extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> place;
  const PlaceDetailScreen({super.key, required this.place});

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  int currentIndex = 0;

  void _openImageViewer(
    BuildContext context,
    List<String> imageUrls,
    int initialIndex,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImageViewer(
          imageUrls: imageUrls,
          initialIndex: initialIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // REMOVED: final provider = FavoriteProvider(); - This was creating a new instance
    return Scaffold(
      backgroundColor: Color(0xFFF5F5DC),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailImageandIcon(size, context), // Removed provider parameter
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.place['title'],
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 25,
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "Room in ${widget.place['address']}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.place['bedAndBathroom'],
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            widget.place['isActive'] == true
                ? ratingAndStarTrue()
                : ratingAndStarFalse(),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  placePropertyList(
                    size,
                    "https://i.pinimg.com/736x/ce/fc/dd/cefcddf44953de9667944a9bf4783783.jpg",
                    "This is a rare find",
                    "${widget.place['vendor']}'s place is usually fully booked.",
                  ),
                  const Divider(),
                  placePropertyList(
                    size,
                    widget.place['vendorProfile'],
                    "Stay with ${widget.place['vendor']}",
                    "Superhost · ${widget.place['yearOfHostin']} years hosting",
                  ),
                  const Divider(),
                  placePropertyList(
                    size,
                    "https://i.pinimg.com/736x/ce/fc/dd/cefcddf44953de9667944a9bf4783783.jpg",
                    "Room in a rental unit",
                    "Your own room in a home, plus access to shared spaces.",
                  ),
                  placePropertyList(
                    size,
                    "https://i.pinimg.com/736x/ce/fc/dd/cefcddf44953de9667944a9bf4783783.jpg",
                    "Shared common spaces",
                    "You'll share parts of the home with the host.",
                  ),
                  placePropertyList(
                    size,
                    "https://i.pinimg.com/736x/ce/fc/dd/cefcddf44953de9667944a9bf4783783.jpg",
                    "Shared bathroom",
                    "You'll share the bathroom with others.",
                  ),
                  const Divider(),
                  SizedBox(height: size.height * 0.02),
                  const Text(
                    "About this place",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Enim praesent elementum facilisis leo vel fringilla est. Sit amet risus nullam eget felis eget. Gravida dictum fusce ut placerat orci nulla.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const Divider(),
                  const Text(
                    "where you'll be",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.place['address'],
                    style: const TextStyle(fontSize: 18, height: 1.5),
                  ),
                  SizedBox(
                    height: 400,
                    width: size.width,
                    child: LocationInMap(
                      place: widget.place as DocumentSnapshot<Object>,
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: priceAndReservation(size),
    );
  }

  Container priceAndReservation(Size size) {
    return Container(
      height: size.height * 0.1,
      decoration: BoxDecoration(color: Color(0xFFF5F5DC)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center),
          Spacer(),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            decoration: BoxDecoration(
              color: Color(0xFF20B2AA),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              "Inquire Now!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFF5F5DC),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Padding placePropertyList(Size size, image, title, subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Divider(),
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(image),
            radius: 29,
          ),
          SizedBox(width: size.width * 0.05),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding ratingAndStarFalse() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 25),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.star),
        const SizedBox(width: 5),
        Text(
          "${widget.place['rating'].toString()} — ",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          "${widget.place['review'].toString()} Reviews",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    ),
  );

  Container ratingAndStarTrue() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                widget.place['rating'].toString(),
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              StarRating(rating: widget.place['rating']),
            ],
          ),
          Stack(
            children: [
              Image.network(
                "https://wallpapers.com/images/high/golden-laurel-wreath-graphic-xvycylskve2cfs0j-xvycylskve2cfs0j.png",
                height: 50,
                width: 60,
                color: Colors.amber,
              ),
              const Positioned(
                child: Text(
                  "  Guest\nFavorite",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                widget.place['review'].toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const Text(
                "Reviews",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // FIXED: Removed provider parameter and used Consumer instead
  Stack detailImageandIcon(Size size, BuildContext context) {
    List<String> imageUrls = List<String>.from(widget.place['imageUrls']);

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            _openImageViewer(context, imageUrls, currentIndex);
          },
          child: SizedBox(
            height: size.height * 0.35,
            child: AnotherCarousel(
              images: widget.place['imageUrls']
                  .map<NetworkImage>((url) => NetworkImage(url))
                  .toList(),
              showIndicator: false,
              dotBgColor: Colors.transparent,
              onImageChange: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              autoplay: false,
              boxfit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black54,
            ),
            child: Text(
              "${currentIndex + 1} / ${widget.place['imageUrls'].length}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          top: 25,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const MyIconButton(icon: Icons.arrow_back_ios_new),
                ),
                Row(
                  children: [
                    const MyIconButton(icon: Icons.share_outlined),
                    const SizedBox(width: 20),
                    // FIXED: Using Consumer for reactive favorite button
                    Consumer<FavoriteProvider>(
                      builder: (context, favoriteProvider, child) {
                        final isFavorite = favoriteProvider.isExist(widget.place);
                        return InkWell(
                          onTap: () {
                            favoriteProvider.toggleFavorite(widget.place);
                          },
                          child: MyIconButton(
                            icon: isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            iconColor: isFavorite
                                ? Colors.red
                                : Colors.black,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FullScreenImageViewer extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;
  const FullScreenImageViewer({
    super.key,
    required this.imageUrls,
    this.initialIndex = 0,
  });
  @override
  State<FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<FullScreenImageViewer> {
  late PageController _pageController;
  late int currentIndex;
  bool _showAppBar = true;
  bool _isZoomed = false;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _toggleAppBar() {
    setState(() {
      _showAppBar = !_showAppBar;
    });
  }

  void _onInteractionStart(ScaleStartDetails details) {
    if (details.pointerCount > 1) {
      setState(() {
        _isZoomed = true;
      });
    }
  }

  void _onInteractionUpdate(ScaleUpdateDetails details) {
    if (details.scale > 1.0) {
      setState(() {
        _isZoomed = true;
      });
    }
  }

  void _onInteractionEnd(ScaleEndDetails details) {
    Future.delayed(Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          _isZoomed = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: _showAppBar
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                "${currentIndex + 1} / ${widget.imageUrls.length}",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            )
          : null,
      body: GestureDetector(
        onTap: _toggleAppBar,
        child: PageView.builder(
          controller: _pageController,
          physics: _isZoomed
              ? NeverScrollableScrollPhysics()
              : BouncingScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemCount: widget.imageUrls.length,
          itemBuilder: (context, index) {
            return InteractiveViewer(
              onInteractionStart: _onInteractionStart,
              onInteractionUpdate: _onInteractionUpdate,
              onInteractionEnd: _onInteractionEnd,
              minScale: 1.0,
              maxScale: 4.0,
              child: Center(
                child: Image.network(
                  widget.imageUrls[index],
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                        color: Colors.white,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error, color: Colors.white, size: 50),
                          SizedBox(height: 10),
                          Text(
                            'Failed to load image',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
