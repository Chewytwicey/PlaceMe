import 'package:flutter/material.dart';
import 'package:placeme/model/filter_options.dart';

class SearchPage extends StatefulWidget {
  final FilterOptions initialFilters;
  final Function(FilterOptions) onApplyFilters;

  const SearchPage({
    super.key,
    required this.initialFilters,
    required this.onApplyFilters,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  late FilterOptions _filters;
  bool _showFilters = false;
  
  // Recent searches - starts empty, will be populated when user searches
  List<String> _recentSearches = [];
  
  // Popular searches - this can have default values
  List<String> _popularSearches = ['pizza', 'mcdonalds', 'ice cream', 'kfc', 'dominos', 'burger king', 'burger', 'pizza hut'];

  @override
  void initState() {
    super.initState();
    _filters = widget.initialFilters.copyWith();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _removeRecentSearch(String search) {
    setState(() {
      _recentSearches.remove(search);
    });
    // TODO: Also remove from persistent storage
  }

  void _performSearch(String query) {
    if (query.trim().isEmpty) return;
    
    // Add to recent searches if not already there
    setState(() {
      // Remove if already exists (to move it to top)
      _recentSearches.remove(query.trim());
      // Add to the beginning of the list
      _recentSearches.insert(0, query.trim());
      // Keep only last 5 searches
      if (_recentSearches.length > 5) {
        _recentSearches = _recentSearches.sublist(0, 5);
      }
    });
    
    // TODO: Implement your actual search logic here (filter results, etc.)
    print('Searching for: $query');
    // TODO: Save to persistent storage (SharedPreferences, database, etc.)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Your ACTUAL SearchBarAndFilter component from original code
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
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
                                      controller: _searchController,
                                      autofocus: true,
                                      onChanged: (value) => _performSearch(value),
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
                      onTap: () {
                        setState(() {
                          _showFilters = !_showFilters;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _showFilters ? Icons.close : Icons.tune,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Filter section (shows when filter icon is tapped)
            if (_showFilters) _buildFilterSection(),
            
            // Search content
            Expanded(
              child: _searchController.text.isEmpty
                  ? _buildSearchSuggestions()
                  : _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filter By',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            // Price filter
            const Text('Price', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '₱${_filters.priceRange.start.round()}-₱${_filters.priceRange.end.round()}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            RangeSlider(
              values: _filters.priceRange,
              min: 0,
              max: 10000,
              divisions: 100,
              activeColor: Colors.green,
              onChanged: (values) {
                setState(() {
                  _filters = _filters.copyWith(priceRange: values);
                });
              },
            ),
            const SizedBox(height: 16),
            
            // Show only available
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Show only active listings', style: TextStyle(fontSize: 14)),
                Switch(
                  value: _filters.showOnlyActive,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _filters = _filters.copyWith(showOnlyActive: value);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Location filter
            const Text('Location', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ['Quezon City', 'Manila', 'Makati', 'Pasig', 'Taguig']
                  .map((location) => FilterChip(
                        label: Text(location),
                        selected: _filters.selectedLocations.contains(location),
                        selectedColor: Colors.green,
                        checkmarkColor: Colors.white,
                        labelStyle: TextStyle(
                          color: _filters.selectedLocations.contains(location)
                              ? Colors.white
                              : Colors.black,
                        ),
                        onSelected: (selected) {
                          setState(() {
                            final newLocations = Set<String>.from(_filters.selectedLocations);
                            if (selected) {
                              newLocations.add(location);
                            } else {
                              newLocations.remove(location);
                            }
                            _filters = _filters.copyWith(selectedLocations: newLocations);
                          });
                        },
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            
            // Apply button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (_filters.selectedLocations.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select at least one location'),
                        backgroundColor: Color(0xFF20B2AA),
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }
                  widget.onApplyFilters(_filters);
                  setState(() {
                    _showFilters = false;
                  });
                },
                child: const Text(
                  'Apply Filters',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchSuggestions() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recent searches
          if (_recentSearches.isNotEmpty) ...[
            const Text(
              'Recent searches',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ..._recentSearches.map((search) => ListTile(
              leading: const Icon(Icons.history, color: Colors.grey),
              title: Text(search),
              trailing: IconButton(
                icon: const Icon(Icons.close, size: 20),
                onPressed: () => _removeRecentSearch(search),
              ),
              onTap: () {
                _searchController.text = search;
                _performSearch(search);
              },
            )),
            const SizedBox(height: 24),
          ],
          
          // Popular searches
          const Text(
            'Popular searches in restaurants',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _popularSearches.map((search) => ActionChip(
              label: Text(search),
              backgroundColor: Colors.grey[100],
              onPressed: () {
                _searchController.text = search;
                _performSearch(search);
              },
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    // TODO: Replace with actual search results
    return Center(
      child: Text('Search results for: ${_searchController.text}'),
    );
  }
}