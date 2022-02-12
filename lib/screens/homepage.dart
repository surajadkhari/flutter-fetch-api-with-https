import 'package:api_future/model/user_model.dart';
import 'package:api_future/services/user_service.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: FutureBuilder<List<UserModel>>(
          future: ApiService().getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  ...snapshot.data!.map((e) => ListTile(
                        title: Text(e.firstname),
                        subtitle: Text(e.lastname),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(e.avatar),
                        ),
                      ))
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
