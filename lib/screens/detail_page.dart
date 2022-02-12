import 'package:api_future/model/user_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.e}) : super(key: key);
  UserModel e;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 60,
                backgroundImage: NetworkImage(e.avatar),
              ),
            ),
            Text(
              e.firstname + " " + e.lastname,
            ),
            Text(e.email),
          ],
        ),
      ),
    );
  }
}
