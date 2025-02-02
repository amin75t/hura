import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  const UserCard({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // User details (Name and email)
          Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$firstName $lastName',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 5),
                  Text(email),
                ],
              ),
            ],
          ),
          // Avatar
          ClipOval(
            child: Image.network(
              avatar,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
