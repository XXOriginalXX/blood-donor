import 'package:flutter/material.dart';
import 'package:blood_donor_finder/models/blood_request.dart';
import 'package:blood_donor_finder/services/database_service.dart';

class RequestList extends StatelessWidget {
  const RequestList({super.key});

  @override
  Widget build(BuildContext context) {
    final databaseService = DatabaseService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Requests'),
      ),
      body: StreamBuilder<List<BloodRequest>>(
        stream: databaseService.getBloodRequests(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final requests = snapshot.data!;

          return ListView.builder(
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: ListTile(
                  title: Text('Blood Type: ${request.bloodType}'),
                  subtitle: Text(
                    'Location: ${request.location}\n'
                        'Status: ${request.status}',
                  ),
                  trailing: request.isUrgent
                      ? const Chip(
                    label: Text('Urgent'),
                    backgroundColor: Colors.red,
                    labelStyle: TextStyle(color: Colors.white),
                  )
                      : null,
                  onTap: () {
                    // TODO: Show request details
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add new blood request
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}