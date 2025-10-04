import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:placeme/Components/another_carousel.dart';
import 'package:placeme/Components/my_icon_button.dart';

class MapWithCustomInfoWindows extends StatefulWidget {
  const MapWithCustomInfoWindows({super.key});

  @override
  State<MapWithCustomInfoWindows> createState() =>
      _MapWithCustomInfoWindowsState();
}

class _MapWithCustomInfoWindowsState extends State<MapWithCustomInfoWindows> {
  LatLng myCurrentLocation = const LatLng(12.879721, 121.774017);
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  late GoogleMapController googleMapController;
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  final CollectionReference placeCollection = FirebaseFirestore.instance
      .collection("myAppCpollection");
  List<Marker> markers = [];
  
  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    customIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(),
      "assets/images/marker.png",
      height: 40,
      width: 40,
    );
    
    placeCollection.snapshots().listen((QuerySnapshot streamSnapshot) {
      if (streamSnapshot.docs.isNotEmpty) {
        final List allMarkers = streamSnapshot.docs;
        List<Marker> myMarker = [];
        for (final marker in allMarkers) {
          final dat = marker.data();
          final data = (dat) as Map;
          myMarker.add(
            Marker(
              markerId: MarkerId(data['address']),
              position: LatLng(data['latitude'], data['longitude']),
              onTap: () {
                if (_customInfoWindowController.googleMapController != null) {
                  Size size = MediaQuery.of(context).size;
                  _customInfoWindowController.addInfoWindow!(
                    Container(
                      height: size.height * 0.32,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                    child: data['imageUrls'] != null &&
                                            data['imageUrls'].isNotEmpty
                                        ? AnotherCarousel(
                                            images: data['imageUrls']
                                                .map<NetworkImage>(
                                                  (url) => NetworkImage(url),
                                                )
                                                .toList(),
                                            dotSize: 5,
                                            indicatorBgPadding: 5,
                                            dotBgColor: Colors.transparent,
                                          )
                                        : Container(
                                            color: Colors.grey,
                                            child: const Icon(
                                              Icons.image_not_supported,
                                              size: 40,
                                            ),
                                          ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 14,
                                  right: 14,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: 12,
                                        ),
                                        // decoration: BoxDecoration(
                                        //   color: Colors.white,
                                        //   borderRadius: BorderRadius.circular(30),
                                        // ),
                                        // child: const Text(
                                        //   // "Guest Favorite",
                                        //   style: TextStyle(
                                        //     fontSize: 12,
                                        //     fontWeight: FontWeight.bold,
                                        //     color: Colors.green,
                                        //   ),
                                        // ),
                                      ),
                                      const Spacer(),
                                      // const MyIconButton(
                                      //   icon: Icons.favorite_border,
                                      //   radius: 15,
                                      // ),
                                      const SizedBox(width: 8),
                                      InkWell(
                                        onTap: () {
                                          _customInfoWindowController
                                              .hideInfoWindow!();
                                        },
                                        child: const MyIconButton(
                                          icon: Icons.close,
                                          radius: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          data['address'],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Icon(Icons.star, size: 16),
                                      const SizedBox(width: 3),
                                      Text(
                                        data['rating'].toString(),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "69420 m elevation",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    data['date'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: '₱${data['price']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: const [
                                        TextSpan(
                                          text: " night",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    LatLng(data['latitude'], data['longitude']),
                  );
                }
              },
              icon: customIcon,
            ),
          );
        }
        setState(() {
          markers = myMarker;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          clipBehavior: Clip.none,
          isScrollControlled: false,
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: size.height * 0.7,
              width: size.width,
              color: Colors.white,
              child: Stack(
                children: [
                  SizedBox(
                    height: size.height * 0.7,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: myCurrentLocation,
                      ),
                      zoomControlsEnabled: false,
                      scrollGesturesEnabled: true,
                      zoomGesturesEnabled: true,
                      tiltGesturesEnabled: false, 
                      rotateGesturesEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        googleMapController = controller;
                        _customInfoWindowController.googleMapController =
                            controller;
                      },
                      onTap: (argument) {
                        _customInfoWindowController.hideInfoWindow!();
                      },
                      onCameraMove: (position) {
                        _customInfoWindowController.onCameraMove!();
                      },
                      markers: markers.toSet(),
                    ),
                  ),
                  CustomInfoWindow(
                    controller: _customInfoWindowController,
                    height: size.height * 0.32,
                    width: size.width * 0.8,
                    offset: 50,
                  ),
                  GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (details.primaryDelta != null &&
                          details.primaryDelta! > 10) {
                        Navigator.pop(context);
                      }
                    },
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 20,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFF20B2AA),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8),
            Text(
              "Map",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF5F5DC),
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.map_outlined, size: 24, color: Color(0xFFF5F5DC)),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}