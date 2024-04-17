import 'package:flutter/material.dart';

Widget buildInfoItem({required IconData icon, required String label}) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
      const SizedBox(width: 8),
      Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    ],
  );
}
