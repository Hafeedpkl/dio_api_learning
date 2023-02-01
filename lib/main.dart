import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: Center(
        child: TextButton(
          onPressed: () {
            // getData();
            // postData();
            // getPostData();
            // putData();
          },
          child: Text('data'),
        ),
      )),
    );
  }
}

void getData() async {
  var dio = Dio();
  var response = await dio.get("https://jsonplaceholder.typicode.com/todos/1");
  print(response.statusCode);
  print(response.data.toString());
}

void postData() async {
  var dio = Dio();
  // var response = await dio.get("https://jsonplaceholder.typicode.com/todos/1");

  var response = await dio.post("https://jsonplaceholder.typicode.com/posts",
      data: {'name': 'hafeed', 'email': 'hafeed@gmail'});

  print(response.statusCode);
  print(response.data.toString());
}

void getPostData() async {
  var dio = Dio();
  // var response = await dio.get("");

  var response = await Future.wait([
    dio.get("https://jsonplaceholder.typicode.com/posts"),
    dio.post("https://jsonplaceholder.typicode.com/posts"),
  ]);
  print(response.length);
  print(response[0].data);
  print(response[1].data);
}

void putData() async {
  var dio = Dio();
  // var response = await dio.get("");

  //!post only create the data , but put is search for the data to update other wise it woll it will create
  var response = await dio.put("https://jsonplaceholder.typicode.com/posts/1",
      data: {'name': 'hafeed', 'email': 'hafeedp@gmail.com'});

  print(response.data);
}
