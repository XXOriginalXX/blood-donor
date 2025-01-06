class BloodRequest {
  final String id;
  final String requesterId;
  final String bloodType;
  final String location;
  final double latitude;
  final double longitude;
  final bool isUrgent;
  final DateTime createdAt;
  final String status;

  BloodRequest({
    required this.id,
    required this.requesterId,
    required this.bloodType,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.isUrgent,
    required this.createdAt,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'requesterId': requesterId,
      'bloodType': bloodType,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'isUrgent': isUrgent,
      'createdAt': createdAt.toIso8601String(),
      'status': status,
    };
  }

  factory BloodRequest.fromMap(Map<String, dynamic> map) {
    return BloodRequest(
      id: map['id'],
      requesterId: map['requesterId'],
      bloodType: map['bloodType'],
      location: map['location'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      isUrgent: map['isUrgent'],
      createdAt: DateTime.parse(map['createdAt']),
      status: map['status'],
    );
  }
}