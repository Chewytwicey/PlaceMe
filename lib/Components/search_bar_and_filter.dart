// import 'package:flutter/material.dart';

// class SearchBarAndFilter extends StatelessWidget {
//   const SearchBarAndFilter({super.key});

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
//                   BoxShadow(blurRadius: 7, color: Colors.black),
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
//                           SizedBox(
//                             height: 20,
//                             child: TextField(
//                               decoration: const InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 hintText: "Search places",
//                                 hintStyle: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 13,
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 isDense: true,
//                                 contentPadding: EdgeInsets.zero,
//                               ),
//                             ),
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
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black),
//               shape: BoxShape.circle,
//             ),
//             child: const Icon(
//               Icons.tune,
//               size: 30,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

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

// class FilterOptions {
//   RangeValues priceRange;
//   Set<String> selectedLocations;
//   Set<String> selectedBedBathroom;
//   int? selectedRating;

//   FilterOptions({
//     this.priceRange = const RangeValues(0, 10000),
//     this.selectedLocations = const {},
//     this.selectedBedBathroom = const {},
//     this.selectedRating,
//   });

//   FilterOptions copyWith({
//     RangeValues? priceRange,
//     Set<String>? selectedLocations,
//     Set<String>? selectedBedBathroom,
//     int? selectedRating,
//   }) {
//     return FilterOptions(
//       priceRange: priceRange ?? this.priceRange,
//       selectedLocations: selectedLocations ?? this.selectedLocations,
//       selectedBedBathroom: selectedBedBathroom ?? this.selectedBedBathroom,
//       selectedRating: selectedRating ?? this.selectedRating,
//     );
//   }
// }

// class FilterBottomSheet extends StatefulWidget {
//   final FilterOptions initialFilters;
//   final Function(FilterOptions) onApplyFilters;

//   const FilterBottomSheet({
//     super.key,
//     required this.initialFilters,
//     required this.onApplyFilters,
//   });

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
//       selectedLocations: Set.from(widget.initialFilters.selectedLocations),
//       selectedBedBathroom: Set.from(widget.initialFilters.selectedBedBathroom),
//       selectedRating: widget.initialFilters.selectedRating,
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
                  
//                   _buildSection(
//                     'Bed & Bathroom',
//                     Column(
//                       children: [
//                         '1 bed · Shared bathroom',
//                         '1 bed · Private bathroom',
//                         '2 beds · Shared bathroom',
//                         '2 beds · Private bathroom'
//                       ].map((option) => CheckboxListTile(
//                             title: Text(option),
//                             value: filters.selectedBedBathroom.contains(option),
//                             activeColor: Colors.green,
//                             contentPadding: EdgeInsets.zero,
//                             controlAffinity: ListTileControlAffinity.trailing,
//                             onChanged: (checked) {
//                               setState(() {
//                                 if (checked == true) {
//                                   filters.selectedBedBathroom.add(option);
//                                 } else {
//                                   filters.selectedBedBathroom.remove(option);
//                                 }
//                               });
//                             },
//                           ))
//                           .toList(),
//                     ),
//                   ),
                  
//                   _buildSection(
//                     'Rating',
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: List.generate(5, (index) {
//                           final rating = index + 1;
//                           return Padding(
//                             padding: const EdgeInsets.only(right: 8),
//                             child: FilterChip(
//                               label: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   const Icon(Icons.star, size: 16, color: Colors.amber),
//                                   const SizedBox(width: 4),
//                                   Text('$rating'),
//                                 ],
//                               ),
//                               selected: filters.selectedRating == rating,
//                               selectedColor: Colors.green,
//                               labelStyle: TextStyle(
//                                 color: filters.selectedRating == rating
//                                     ? Colors.white
//                                     : Colors.black,
//                               ),
//                               onSelected: (selected) {
//                                 setState(() {
//                                   filters.selectedRating = selected ? rating : null;
//                                 });
//                               },
//                             ),
//                           );
//                         }),
//                       ),
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





// import 'package:flutter/material.dart';

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

// class FilterOptions {
//   RangeValues priceRange;
//   bool showOnlyActive;
//   Set<String> selectedLocations;

//   FilterOptions({
//     this.priceRange = const RangeValues(0, 10000),
//     this.showOnlyActive = false,
//     this.selectedLocations = const {},
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
//     super.key,
//     required this.initialFilters,
//     required this.onApplyFilters,
//   });

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
//                         content: Text('Please select at least one location'),
//                         backgroundColor: Color(0xFF20B2AA),
//                         behavior: SnackBarBehavior.floating,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         duration: Duration(seconds: 2),
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
    filters = widget.initialFilters.copyWith();
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
                              filters = filters.copyWith(priceRange: values);
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
                              filters = filters.copyWith(showOnlyActive: value);
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
                                    final newLocations = Set<String>.from(filters.selectedLocations);
                                    if (selected) {
                                      newLocations.add(location);
                                    } else {
                                      newLocations.remove(location);
                                    }
                                    filters = filters.copyWith(selectedLocations: newLocations);
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
                      const SnackBar(
                        content: Text('Please select at least one location'),
                        backgroundColor: Color(0xFF20B2AA),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }

                  widget.onApplyFilters(filters);
                  Navigator.pop(context);
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
