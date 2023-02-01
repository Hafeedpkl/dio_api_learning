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
          child: Text('Post data'),
        ),
      )),
    );
  }
}

void fetchData() async {
  var dio = Dio();
  // var response = await dio.get("");

  var response = await Future.wait([
    dio.get("https://jsonplaceholder.typicode.com/posts/1"),
    dio.post("https://jsonplaceholder.typicode.com/posts"),
  ]);
  print(response.length);
  print(response[0].data);
  print(response[1].data);
}
