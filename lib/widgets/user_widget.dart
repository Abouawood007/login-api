import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  final String? imageUrl;
  const UserWidget(
      {required this.firstName,
        required this.lastName,
        required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(firstName!),
      leading: Image.network(imageUrl!),
      subtitle: Text(lastName!),
    );
  }
}