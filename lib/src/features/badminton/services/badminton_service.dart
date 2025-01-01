import 'package:firebase_database/firebase_database.dart';
import 'dart:convert'; // For json encoding/decoding
import '../models/badminton_model.dart';

class BadmintonService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref('badminton');

  /// Fetch all Badminton items from Firebase
  Future<List<Badminton>> fetchBadmintons() async {
    try {
      final snapshot = await _dbRef.get();
      if (snapshot.exists) {
        List<Badminton> badmintonList = [];
        Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          badmintonList.add(Badminton.fromMap(value));
        });
        return badmintonList;
      } else {
        return []; // Return an empty list if no data exists
      }
    } catch (e) {
      print('Error fetching badminton data: $e');
      rethrow; // Rethrow the exception for handling by the caller
    }
  }

  /// Fetch a single Badminton item by ID
  Future<Badminton?> fetchBadmintonById(String id) async {
    try {
      final snapshot = await _dbRef.child(id).get();
      if (snapshot.exists) {
        return Badminton.fromMap(snapshot.value as Map<dynamic, dynamic>);
      } else {
        return null; // Return null if item doesn't exist
      }
    } catch (e) {
      print('Error fetching badminton by ID: $e');
      rethrow;
    }
  }

  /// Update a Badminton item in Firebase
  Future<void> updateBadminton(Badminton badminton) async {
    try {
      await _dbRef.child(badminton.id).set(badminton.toMap());
      print('Badminton ${badminton.id} updated successfully.');
    } catch (e) {
      print('Error updating badminton: $e');
      rethrow;
    }
  }

  /// Add a new Badminton item to Firebase
  Future<void> addBadminton(Badminton badminton) async {
    try {
      await _dbRef.child(badminton.id).set(badminton.toMap());
      print('Badminton ${badminton.id} added successfully.');
    } catch (e) {
      print('Error adding badminton: $e');
      rethrow;
    }
  }

  /// Delete a Badminton item from Firebase
  Future<void> deleteBadminton(String id) async {
    try {
      await _dbRef.child(id).remove();
      print('Badminton $id deleted successfully.');
    } catch (e) {
      print('Error deleting badminton: $e');
      rethrow;
    }
  }
}
