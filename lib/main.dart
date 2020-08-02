import 'package:flutter/material.dart';
import 'package:flutterjsonmodel/model/user_model.dart';
import 'package:flutterjsonmodel/services/networking.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<List<User>> getDataFromServer() async {
    NetworkHelper helper =
        NetworkHelper("https://api.github.com/users?since=135");
    List<dynamic> data = await helper.getData();
    List<User> users = data.map((data) => User.fromJson(data)).toList();
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: FutureBuilder<List<User>>(
            future: getDataFromServer(),
            builder: (context, data) {
              if (!data.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<User> userList = data.data;
              return ListView.builder(
                itemBuilder: (_, index) {
                  User user = userList[index];
                  return ListTile(
                    leading: Text(user.id.toString()),
                    title: Text(user.login),
                    trailing: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatarUrl),
                    ),
                  );
                },
                itemCount: userList.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
