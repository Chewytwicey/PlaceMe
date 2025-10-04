  // // lib/components/filter_bottom_sheet.dart
  import 'package:flutter/material.dart';
  import 'package:placeme/model/filter_options.dart';

  class FilterBottomSheet extends StatefulWidget {
    final FilterOptions initialFilters;
    final ValueChanged<FilterOptions> onApplyFilters;

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
      // make a defensive copy of the incoming filter set
      filters = widget.initialFilters.copyWith(
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
                  const Text('Filter By', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
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
                                '₱${filters.priceRange.start.round()} - ₱${filters.priceRange.end.round()}',
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
                            onChanged: (values) => setState(() => filters.priceRange = values),
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
                            child: Text('Show only active listings', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ),
                          Switch(
                            value: filters.showOnlyActive,
                            activeColor: Colors.green,
                            onChanged: (v) => setState(() => filters.showOnlyActive = v),
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
                                    color: filters.selectedLocations.contains(location) ? Colors.white : Colors.black,
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
                    
                    // Just call the callback - let the parent handle navigation
                    widget.onApplyFilters(filters);
                    Navigator.pop(context);
                  },
                  child: const Text('Apply Filters', style: TextStyle(fontSize: 16, color: Colors.white)),
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
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            content,
          ],
        ),
      );
    }
  }