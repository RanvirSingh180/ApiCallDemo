import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'color_data.dart';
import 'color_list.dart';

const baseUrl = 'https://reqres.in/api/unknown';

Future<List<ColorData>> fetchColor() async {
  final response = await http.get(Uri.parse(baseUrl));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body);

    return parsed['data']
        .map<ColorData>((json) => ColorData.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to load');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ApiCallHome(),
    );
  }
}

class ApiCallHome extends StatefulWidget {
  const ApiCallHome({Key? key}) : super(key: key);

  @override
  State<ApiCallHome> createState() => _ApiCallHomeState();
}

class _ApiCallHomeState extends State<ApiCallHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Api Call Test"),
        ),
        body: const ApiCallBody());
  }
}

class ApiCallBody extends StatefulWidget {
  const ApiCallBody({Key? key}) : super(key: key);

  @override
  State<ApiCallBody> createState() => _ApiCallBodyState();
}

class _ApiCallBodyState extends State<ApiCallBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ColorData>>(
        future: fetchColor(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          var colors = snapshot.data as List<ColorData>;
          return colors.isNotEmpty
              ? ColorDataList(colorData: colors)
              : const Center(child: CircularProgressIndicator());
        });
  }
}
