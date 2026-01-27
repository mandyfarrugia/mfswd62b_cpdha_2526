import 'package:flutter/material.dart';

class DeleteConfirmationService {
  const DeleteConfirmationService();

  DeleteConfirmationService.create() {
    DeleteConfirmationService();
  }

  Future<bool?> showDeleteConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete asset'),
          content: const Text(
            'Are you sure you want to delete this asset?\n\nThis action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}