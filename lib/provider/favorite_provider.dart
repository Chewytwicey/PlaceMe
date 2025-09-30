import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _favoritesIds = [];
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final bool _isLoading = false;
  
  List<String> get favorites => _favoritesIds;
  bool get isLoading => _isLoading;
  
  FavoriteProvider() {
    _initializeFavorites();
  }

  // Simplified initialization
  Future<void> _initializeFavorites() async {
    // Load favorites immediately if user is already logged in
    await loadFavorite();
    
    // Also listen for auth changes
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        await loadFavorite();
      } else {
        _favoritesIds.clear();
        notifyListeners();
      }
    });
  }

  // Enhanced toggleFavorite with better debugging
  Future<void> toggleFavorite(dynamic place) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      debugPrint('❌ No user logged in');
      return;
    }

    String placeId;
    if (place is DocumentSnapshot || place is QueryDocumentSnapshot) {
      placeId = place.id;
    } else {
      debugPrint('❌ Invalid place type: ${place.runtimeType}');
      return;
    }

    debugPrint('🔄 Toggle favorite called for: $placeId');
    debugPrint('📋 Current favorites: $_favoritesIds');
    debugPrint('❓ Is currently favorite: ${_favoritesIds.contains(placeId)}');

    try {
      if (_favoritesIds.contains(placeId)) {
        // Remove from favorites
        debugPrint('➖ Removing from favorites...');
        _favoritesIds.remove(placeId);
        notifyListeners(); // Update UI immediately
        
        await _removeFavorite(placeId);
        debugPrint('✅ Successfully removed from favorites: $placeId');
      } else {
        // Add to favorites
        debugPrint('➕ Adding to favorites...');
        _favoritesIds.add(placeId);
        notifyListeners(); // Update UI immediately
        
        await _addFavorite(placeId);
        debugPrint('✅ Successfully added to favorites: $placeId');
      }
      
      debugPrint('📋 New favorites list: $_favoritesIds');
      
    } catch (e) {
      debugPrint('❌ Error toggling favorite: $e');
      
      // Revert the local change if database operation failed
      if (_favoritesIds.contains(placeId)) {
        _favoritesIds.remove(placeId);
        debugPrint('🔄 Reverted: Removed from local list');
      } else {
        _favoritesIds.add(placeId);
        debugPrint('🔄 Reverted: Added back to local list');
      }
      notifyListeners();
    }
  }

  bool isExist(dynamic place) {
    if (place is DocumentSnapshot || place is QueryDocumentSnapshot) {
      final exists = _favoritesIds.contains(place.id);
      debugPrint('🔍 Checking if ${place.id} exists: $exists');
      return exists;
    } else if (place is String) {
      return _favoritesIds.contains(place);
    }
    return false;
  }

  Future<void> _addFavorite(String placeId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('No user logged in');

    debugPrint('💾 Saving to Firestore: userFavorites/${user.uid}/favorites/$placeId');
    
    await firestore
        .collection("userFavorites")
        .doc(user.uid)
        .collection("favorites")
        .doc(placeId)
        .set({
      'placeId': placeId,
      'isFavorite': true,  // ADD THIS LINE
      'timestamp': FieldValue.serverTimestamp(),
    });
    
    debugPrint('✅ Saved to Firestore successfully');
  }

  Future<void> _removeFavorite(String placeId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('No user logged in');

    debugPrint('🗑️ Deleting from Firestore: userFavorites/${user.uid}/favorites/$placeId');
    
    await firestore
        .collection("userFavorites")
        .doc(user.uid)
        .collection("favorites")
        .doc(placeId)
        .delete();
        
    debugPrint('✅ Deleted from Firestore successfully');
  }

  Future<void> loadFavorite() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      debugPrint('⚠️ No user logged in, cannot load favorites');
      return;
    }

    try {
      debugPrint('📥 Loading favorites for user: ${user.uid}');
      QuerySnapshot snapshot = await firestore
          .collection('userFavorites')
          .doc(user.uid)
          .collection('favorites')
          .get();
      
      _favoritesIds = snapshot.docs.map((doc) => doc.id).toList();
      debugPrint('✅ Loaded ${_favoritesIds.length} favorites: $_favoritesIds');
    } catch (e) {
      debugPrint('❌ Error loading favorites: $e');
      _favoritesIds = [];
    }
    notifyListeners();
  }

  // Method to check if user is authenticated
  bool get isUserAuthenticated => FirebaseAuth.instance.currentUser != null;

  // Method to get current user ID
  String? get currentUserId => FirebaseAuth.instance.currentUser?.uid;

  // Refresh favorites (useful for manual refresh)
  Future<void> refreshFavorites() async {
    await loadFavorite();
  }

  // Clear favorites (useful for logout)
  void clearFavorites() {
    _favoritesIds.clear();
    notifyListeners();
  }

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }
}