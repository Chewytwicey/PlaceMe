// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:placeme/Components/display_total_price.dart';
// import 'package:placeme/Components/map_with_custom_info_windows.dart';
// import 'package:placeme/Components/search_bar_and_filter.dart';

// import '../Components/display_places.dart';

// class ExploreScreen extends StatefulWidget {
//   const ExploreScreen({super.key});

//   @override
//   State<ExploreScreen> createState() => _ExploreScreenState();
// }

// class _ExploreScreenState extends State<ExploreScreen> {
//   final CollectionReference categoryCollection = FirebaseFirestore.instance
//       .collection("AppCategory");
//   int selectedIndex = 0;
  
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Color(0xFFF5F5DC),
//       body: Stack(
//         children: [
//           SafeArea(
//             bottom: false,
//             child: Column(
//               children: [
//                 SearchBarAndFilter(),
//                 listOfCategoryItems(size),
//                 const Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                       SizedBox(height: 15),
//                       DisplayPlaces(),
//                       SizedBox(height: 120),
//                       ]
//                     )
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 110,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: const MapWithCustomInfoWindows(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   StreamBuilder<QuerySnapshot<Object?>> listOfCategoryItems(Size size) {
//     return StreamBuilder(
//       stream: categoryCollection.snapshots(),
//       builder: (context, streamSnapshot) {
//         if (streamSnapshot.hasData) {
//           return Stack(
//             children: [
//               Positioned(
//                 left: 0,
//                 right: 0,
//                 top: 80,
//                 child: Divider(color: const Color.fromARGB(255, 0, 0, 0)),
//               ),
//               SizedBox(
//                 height: size.height * 0.12,
//                 child: ListView.builder(
//                   padding: EdgeInsets.zero,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: streamSnapshot.data!.docs.length,
//                   physics: const BouncingScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = index;
//                         });
//                       },
//                       child: Container(
//                         padding: EdgeInsets.only(top: 20, right: 20, left: 20),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 32,
//                               width: 40,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Image.network(
//                                 streamSnapshot.data!.docs[index]['image'],
//                                 color: selectedIndex == index
//                                     ? Colors.black
//                                     : Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               streamSnapshot.data!.docs[index]['title'],
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 color: selectedIndex == index
//                                     ? Colors.black
//                                     : Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 8.5),
//                             Container(
//                               height: 5,
//                               width: 50,
//                               color: selectedIndex == index
//                                   ? Color(0xFF20B2AA)
//                                   : Colors.transparent,
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         }
//         return Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:placeme/Components/display_total_price.dart';
// import 'package:placeme/Components/map_with_custom_info_windows.dart';
// import 'package:placeme/Components/search_bar_and_filter.dart';

// import '../Components/display_places.dart';

// class ExploreScreen extends StatefulWidget {
//   const ExploreScreen({super.key});

//   @override
//   State<ExploreScreen> createState() => _ExploreScreenState();
// }

// class _ExploreScreenState extends State<ExploreScreen> {
//   final CollectionReference categoryCollection = FirebaseFirestore.instance
//       .collection("AppCategory");
//   int selectedIndex = 0;
  
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Color(0xFFF5F5DC),
//       body: Stack(
//         children: [
//           SafeArea(
//             bottom: false,
//             child: Column(
//               children: [
//                 SearchBarAndFilter(),
//                 listOfCategoryItems(size),
//                 const Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                       SizedBox(height: 15),
//                       DisplayPlaces(),
//                       SizedBox(height: 120),
//                       ]
//                     )
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 110,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: const MapWithCustomInfoWindows(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   StreamBuilder<QuerySnapshot<Object?>> listOfCategoryItems(Size size) {
//     return StreamBuilder(
//       stream: categoryCollection.snapshots(),
//       builder: (context, streamSnapshot) {
//         if (streamSnapshot.hasData) {
//           return Stack(
//             children: [
//               Positioned(
//                 left: 0,
//                 right: 0,
//                 top: 80,
//                 child: Divider(color: const Color.fromARGB(255, 0, 0, 0)),
//               ),
//               SizedBox(
//                 height: size.height * 0.12,
//                 child: ListView.builder(
//                   padding: EdgeInsets.zero,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: streamSnapshot.data!.docs.length,
//                   physics: const BouncingScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = index;
//                         });
//                       },
//                       child: Container(
//                         padding: EdgeInsets.only(top: 20, right: 20, left: 20),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 32,
//                               width: 40,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Image.network(
//                                 streamSnapshot.data!.docs[index]['image'],
//                                 color: selectedIndex == index
//                                     ? Colors.black
//                                     : Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               streamSnapshot.data!.docs[index]['title'],
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 color: selectedIndex == index
//                                     ? Colors.black
//                                     : Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 8.5),
//                             Container(
//                               height: 5,
//                               width: 50,
//                               color: selectedIndex == index
//                                   ? Color(0xFF20B2AA)
//                                   : Colors.transparent,
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         }
//         return Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:placeme/Components/map_with_custom_info_windows.dart';
// import '../Components/display_places.dart';

// class SearchBarAndFilter extends StatelessWidget {
//   final TextEditingController searchController;
//   final Function(String) onSearchChanged;
//   final VoidCallback onFilterTap;

//   const SearchBarAndFilter({
//     super.key,
//     required this.searchController,
//     required this.onSearchChanged,
//     required this.onFilterTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 27),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: const [
//                   BoxShadow(blurRadius: 7, color: Colors.black26),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.search, size: 32),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Text(
//                             "Where to?",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           TextField(
//                             controller: searchController,
//                             onChanged: onSearchChanged,
//                             decoration: const InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "Search places",
//                               hintStyle: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 13,
//                               ),
//                               isDense: true,
//                               contentPadding: EdgeInsets.zero,
//                             ),
//                             style: const TextStyle(fontSize: 13),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 8),
//           GestureDetector(
//             onTap: onFilterTap,
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(
//                 Icons.tune,
//                 size: 30,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ExploreScreen extends StatefulWidget {
//   const ExploreScreen({super.key});

//   @override
//   State<ExploreScreen> createState() => _ExploreScreenState();
// }

// class _ExploreScreenState extends State<ExploreScreen> {
//   final CollectionReference categoryCollection =
//       FirebaseFirestore.instance.collection("AppCategory");

//   final TextEditingController _searchController = TextEditingController();
//   FilterOptions _filters = FilterOptions();
//   String _searchQuery = '';

//   int selectedIndex = 0;

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _showFilterBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (modalContext) => FilterBottomSheet(
//         initialFilters: _filters,
//         onApplyFilters: (newFilters) {
//           if (newFilters.selectedLocations.isEmpty) {
//             showDialog(
//               context: context,
//               barrierDismissible: true,
//               builder: (dialogContext) => AlertDialog(
//                 backgroundColor: const Color(0xFF20B2AA),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 content: const Text(
//                   'Please select at least one location',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 actions: [
//                   TextButton(
//                     onPressed: () => Navigator.pop(dialogContext),
//                     child: const Text('OK', style: TextStyle(color: Colors.white)),
//                   ),
//                 ],
//               ),
//             );
//             return;
//           }

//           Navigator.pop(modalContext);
//           setState(() {
//             _filters = newFilters;
//           });
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5DC),
//       body: Stack(
//         children: [
//           SafeArea(
//             bottom: false,
//             child: Column(
//               children: [
//                 SearchBarAndFilter(
//                   searchController: _searchController,
//                   onSearchChanged: (query) {
//                     setState(() {
//                       _searchQuery = query;
//                     });
//                   },
//                   onFilterTap: _showFilterBottomSheet,
//                 ),
//                 listOfCategoryItems(size),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(children: [
//                       const SizedBox(height: 15),
//                       DisplayPlaces(
//                         searchQuery: _searchQuery,
//                         filters: _filters,
//                       ),
//                       const SizedBox(height: 120),
//                     ]),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 110,
//             left: 0,
//             right: 0,
//             child: Center(
//               // If MapWithCustomInfoWindows doesn't have a const ctor remove the const.
//               child:  MapWithCustomInfoWindows(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   StreamBuilder<QuerySnapshot<Object?>> listOfCategoryItems(Size size) {
//     return StreamBuilder(
//       stream: categoryCollection.snapshots(),
//       builder: (context, streamSnapshot) {
//         if (streamSnapshot.hasData) {
//           return Stack(
//             children: [
//               const Positioned(
//                 left: 0,
//                 right: 0,
//                 top: 80,
//                 child: Divider(color: Color.fromARGB(255, 0, 0, 0)),
//               ),
//               SizedBox(
//                 height: size.height * 0.12,
//                 child: ListView.builder(
//                   padding: EdgeInsets.zero,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: streamSnapshot.data!.docs.length,
//                   physics: const BouncingScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = index;
//                         });
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 32,
//                               width: 40,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Image.network(
//                                 streamSnapshot.data!.docs[index]['image'],
//                                 // You probably want different colors for selected/unselected.
//                                 color: selectedIndex == index ? Colors.black : Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               streamSnapshot.data!.docs[index]['title'],
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 color: selectedIndex == index ? Colors.black : Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 8.5),
//                             Container(
//                               height: 5,
//                               width: 50,
//                               color: selectedIndex == index
//                                   ? const Color(0xFF20B2AA)
//                                   : Colors.transparent,
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }

// class FilterOptions {
//   RangeValues priceRange;
//   bool showOnlyActive;
//   Set<String> selectedLocations;

//   FilterOptions({
//     this.priceRange = const RangeValues(0, 10000),
//     this.showOnlyActive = false,
//     this.selectedLocations = const <String>{},
//   });

//   FilterOptions copyWith({
//     RangeValues? priceRange,
//     bool? showOnlyActive,
//     Set<String>? selectedLocations,
//   }) {
//     return FilterOptions(
//       priceRange: priceRange ?? this.priceRange,
//       showOnlyActive: showOnlyActive ?? this.showOnlyActive,
//       selectedLocations: selectedLocations ?? this.selectedLocations,
//     );
//   }
// }

// class FilterBottomSheet extends StatefulWidget {
//   final FilterOptions initialFilters;
//   final Function(FilterOptions) onApplyFilters;

//   const FilterBottomSheet({
//     Key? key,
//     required this.initialFilters,
//     required this.onApplyFilters,
//   }) : super(key: key);

//   @override
//   State<FilterBottomSheet> createState() => _FilterBottomSheetState();
// }

// class _FilterBottomSheetState extends State<FilterBottomSheet> {
//   late FilterOptions filters;

//   @override
//   void initState() {
//     super.initState();
//     filters = FilterOptions(
//       priceRange: widget.initialFilters.priceRange,
//       showOnlyActive: widget.initialFilters.showOnlyActive,
//       selectedLocations: Set.from(widget.initialFilters.selectedLocations),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.8,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Filter By',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.close),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             ),
//           ),
//           const Divider(height: 1),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildSection(
//                     'Price',
//                     Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Text(
//                               '₱${filters.priceRange.start.round()}-₱${filters.priceRange.end.round()}',
//                               style: const TextStyle(color: Colors.grey),
//                             ),
//                           ],
//                         ),
//                         RangeSlider(
//                           values: filters.priceRange,
//                           min: 0,
//                           max: 10000,
//                           divisions: 100,
//                           activeColor: Colors.green,
//                           onChanged: (values) {
//                             setState(() {
//                               filters.priceRange = values;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   _buildSection(
//                     'Show Only Available',
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Expanded(
//                           child: Text(
//                             'Show only active listings',
//                             style: TextStyle(color: Colors.grey, fontSize: 12),
//                           ),
//                         ),
//                         Switch(
//                           value: filters.showOnlyActive,
//                           activeColor: Colors.green,
//                           onChanged: (value) {
//                             setState(() {
//                               filters.showOnlyActive = value;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   _buildSection(
//                     'Location',
//                     Wrap(
//                       spacing: 8,
//                       runSpacing: 8,
//                       children: ['Quezon City', 'Manila', 'Makati', 'Pasig', 'Taguig']
//                           .map((location) => FilterChip(
//                                 label: Text(location),
//                                 selected: filters.selectedLocations.contains(location),
//                                 selectedColor: Colors.green,
//                                 checkmarkColor: Colors.white,
//                                 labelStyle: TextStyle(
//                                   color: filters.selectedLocations.contains(location)
//                                       ? Colors.white
//                                       : Colors.black,
//                                 ),
//                                 onSelected: (selected) {
//                                   setState(() {
//                                     if (selected) {
//                                       filters.selectedLocations.add(location);
//                                     } else {
//                                       filters.selectedLocations.remove(location);
//                                     }
//                                   });
//                                 },
//                               ))
//                           .toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 onPressed: () {
//                   if (filters.selectedLocations.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: const Text('Please select at least one location'),
//                         backgroundColor: const Color(0xFF20B2AA),
//                         behavior: SnackBarBehavior.floating,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         duration: const Duration(seconds: 2),
//                       ),
//                     );
//                     return;
//                   }

//                   widget.onApplyFilters(filters);
//                   Navigator.pop(context);
//                 },
//                 child: const Text(
//                   'Apply Filters',
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSection(String title, Widget content) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 12),
//           content,
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:placeme/Components/map_with_custom_info_windows.dart';
import 'package:placeme/pages/results_page.dart';
import '../Components/display_places.dart';
import 'package:placeme/model/filter_options.dart';

class SearchBarAndFilter extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final VoidCallback onFilterTap;

  const SearchBarAndFilter({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(blurRadius: 7, color: Colors.black26),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    const Icon(Icons.search, size: 32),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Where to?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            controller: searchController,
                            onChanged: onSearchChanged,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search places",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onFilterTap,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.tune,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection("AppCategory");

  final TextEditingController _searchController = TextEditingController();
  late FilterOptions _filters;
  String _searchQuery = '';

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _filters = FilterOptions(
      priceRange: const RangeValues(0, 10000),
      showOnlyActive: false,
      selectedLocations: {},
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) => FilterBottomSheet(
        initialFilters: _filters,
        onApplyFilters: (newFilters) {
          if (newFilters.selectedLocations.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please select at least one location'),
                backgroundColor: Color(0xFF20B2AA),
              ),
            );
            return;
          }
          
          // Close the bottom sheet
          Navigator.pop(modalContext);
          
          // Navigate to ResultsPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ResultsPage(
                filters: newFilters,
                searchQuery: _searchQuery,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                SearchBarAndFilter(
                  searchController: _searchController,
                  onSearchChanged: (query) {
                    setState(() {
                      _searchQuery = query;
                    });
                  },
                  onFilterTap: _showFilterBottomSheet,
                ),
                listOfCategoryItems(size),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      const SizedBox(height: 15),
                      DisplayPlaces(
                        searchQuery: _searchQuery,
                        filters: FilterOptions(  // Default filters - shows ALL places on home screen
                          priceRange: const RangeValues(0, 10000),
                          showOnlyActive: false,
                          selectedLocations: {},  // Empty = show all locations
                        ), 
                      ),
                      const SizedBox(height: 120),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 110,
            left: 0,
            right: 0,
            child: Center(
              child: MapWithCustomInfoWindows(),
            ),
          ),
        ],
      ),
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> listOfCategoryItems(Size size) {
    return StreamBuilder(
      stream: categoryCollection.snapshots(),
      builder: (context, streamSnapshot) {
        if (streamSnapshot.hasData) {
          return Stack(
            children: [
              const Positioned(
                left: 0,
                right: 0,
                top: 80,
                child: Divider(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              SizedBox(
                height: size.height * 0.12,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: streamSnapshot.data!.docs.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 32,
                              width: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                streamSnapshot.data!.docs[index]['image'],
                                color: selectedIndex == index ? Colors.black : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              streamSnapshot.data!.docs[index]['title'],
                              style: TextStyle(
                                fontSize: 13,
                                color: selectedIndex == index ? Colors.black : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8.5),
                            Container(
                              height: 5,
                              width: 50,
                              color: selectedIndex == index
                                  ? const Color(0xFF20B2AA)
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  final FilterOptions initialFilters;
  final Function(FilterOptions) onApplyFilters;

  const FilterBottomSheet({
    super.key,
    required this.initialFilters,
    required this.onApplyFilters,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late FilterOptions filters;

  @override
  void initState() {
    super.initState();
    filters = FilterOptions(
      priceRange: widget.initialFilters.priceRange,
      showOnlyActive: widget.initialFilters.showOnlyActive,
      selectedLocations: Set.from(widget.initialFilters.selectedLocations),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter By',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    'Price',
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '₱${filters.priceRange.start.round()}-₱${filters.priceRange.end.round()}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        RangeSlider(
                          values: filters.priceRange,
                          min: 0,
                          max: 10000,
                          divisions: 100,
                          activeColor: Colors.green,
                          onChanged: (values) {
                            setState(() {
                              filters.priceRange = values;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  _buildSection(
                    'Show Only Available',
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            'Show only active listings',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                        Switch(
                          value: filters.showOnlyActive,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              filters.showOnlyActive = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  _buildSection(
                    'Location',
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: ['Quezon City', 'Manila', 'Makati', 'Pasig', 'Taguig']
                          .map((location) => FilterChip(
                                label: Text(location),
                                selected: filters.selectedLocations.contains(location),
                                selectedColor: Colors.green,
                                checkmarkColor: Colors.white,
                                labelStyle: TextStyle(
                                  color: filters.selectedLocations.contains(location)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                onSelected: (selected) {
                                  setState(() {
                                    if (selected) {
                                      filters.selectedLocations.add(location);
                                    } else {
                                      filters.selectedLocations.remove(location);
                                    }
                                  });
                                },
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (filters.selectedLocations.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Please select at least one location'),
                        backgroundColor: const Color(0xFF20B2AA),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    return;
                  }
                  widget.onApplyFilters(filters);
                },
                child: const Text(
                  'Apply Filters',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          content,
        ],
      ),
    );
  }
}