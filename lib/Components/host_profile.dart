import 'package:flutter/material.dart';

class HostProfile extends StatelessWidget {
  final String hostImageUrl;
  final String hostName;
  final String hostingYears;
  final bool isSuperhost;

  const HostProfile({
    super.key,
    required this.hostImageUrl,
    required this.hostName,
    required this.hostingYears,
    this.isSuperhost = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Host avatar
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(hostImageUrl),
            backgroundColor: Colors.grey.shade200,
            onBackgroundImageError: (exception, stackTrace) {
              // Handle image loading error
            },
            child: hostImageUrl.isEmpty 
                ? Icon(Icons.person, size: 30, color: Colors.grey)
                : null,
          ),
          const SizedBox(width: 16),
          // Host info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stay with $hostName",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (isSuperhost) ...[
                      const Text(
                        "Superhost",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      const Text(
                        " · ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                    Text(
                      "$hostingYears years hosting",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}