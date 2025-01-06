import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blood_donor_finder/models/user_model.dart';
import 'package:blood_donor_finder/models/blood_request.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // User operations
  Future<void> createUser(UserModel user) async {
    await _db.collection('users').doc(user.id).set(user.toMap());
  }

  Future<UserModel?> getUser(String userId) async {
    final doc = await _db.collection('users').doc(userId).get();
    return doc.exists ? UserModel.fromMap(doc.data()!) : null;
  }

  Stream<List<UserModel>> getNearbyDonors(
      double latitude,
      double longitude,
      String bloodType,
      double radiusInKm,
      ) {
    // Implementation using Firestore GeoPoint queries
    return _db
        .collection('users')
        .where('isDonor', isEqualTo: true)
        .where('isAvailable', isEqualTo: true)
        .where('bloodType', isEqualTo: bloodType)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => UserModel.fromMap(doc.data()))
          .toList();
    });
  }

  // Blood request operations
  Future<void> createBloodRequest(BloodRequest request) async {
    await _db.collection('requests').add(request.toMap());
  }

  Stream<List<BloodRequest>> getBloodRequests() {
    return _db
        .collection('requests')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => BloodRequest.fromMap(doc.data()))
          .toList();
    });
  }
}