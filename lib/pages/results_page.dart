import 'package:flutter/material.dart';
import 'package:placeme/Components/display_places.dart';
import 'package:placeme/model/filter_options.dart';

class ResultsPage extends StatelessWidget {
  final FilterOptions filters;
  final String? searchQuery;

  const ResultsPage({
    super.key,
    required this.filters,
    this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        title: const Text("Filtered Results"),
        backgroundColor: const Color(0xFFF5F5DC),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DisplayPlaces(
              filters: filters,
              searchQuery: searchQuery,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}