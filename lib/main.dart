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
            fetchData();
          },
          child: Text('post data'),
        ),
      )),
    );
  }
}

void fetchData() async {
  var dio = Dio();
  // var response = await dio.get("https://jsonplaceholder.typicode.com/todos/1");
  var response = await dio.post("https://jsonplaceholder.typicode.com/posts",
      data: {'name': 'hafeed', 'email': 'hafeed@gmail'});

  print(response.statusCode);
  print(response.data.toString());
}
