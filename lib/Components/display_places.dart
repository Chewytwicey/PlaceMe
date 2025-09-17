import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'another_carousel.dart';

class DisplayPlaces extends StatefulWidget {
  const DisplayPlaces({super.key});

  @override
  State<DisplayPlaces> createState() => _DisplayPlacesState();
}

class _DisplayPlacesState extends State<DisplayPlaces> {
  final CollectionReference placeCollection = FirebaseFirestore.instance
      .collection("myAppCpollection");
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: placeCollection.snapshots(),
      builder: (context, streamSnapshot) {
        if (streamSnapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: streamSnapshot.data!.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, Index) {
              final place = streamSnapshot.data!.docs[Index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              height: 360,
                              width: double.infinity,
                              child: AnotherCarousel(
                                image: place['imageUrls']
                                    .map((url) => NetworkImage(url))
                                    .toList(),
                                dotSize: 6,
                                indicatorBgPadding: 5,
                                dotBgcolor: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
