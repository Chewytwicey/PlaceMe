import 'package:flutter/material.dart';

class FilterOptions {
  RangeValues priceRange;
  bool showOnlyActive;
  Set<String> selectedLocations;

  FilterOptions({
    this.priceRange = const RangeValues(0, 10000),
    this.showOnlyActive = false,
    this.selectedLocations = const <String>{},
  });

  FilterOptions copyWith({
    RangeValues? priceRange,
    bool? showOnlyActive,
    Set<String>? selectedLocations,
  }) {
    return FilterOptions(
      priceRange: priceRange ?? this.priceRange,
      showOnlyActive: showOnlyActive ?? this.showOnlyActive,
      selectedLocations: selectedLocations ?? this.selectedLocations,
    );
  }
}
