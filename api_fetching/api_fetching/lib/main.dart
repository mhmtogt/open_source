import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String baseUrl = 'https://kitsu.io/api/edge/';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kitsu API Örneği'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  fetchData();
                },
                child: const Text('Veri Al'),
              ),
              ElevatedButton(
                onPressed: () {
                  createData();
                },
                child: const Text('Veri Oluştur'),
              ),
              ElevatedButton(
                onPressed: () {
                  updateData();
                },
                child: const Text('Veri Güncelle'),
              ),
              ElevatedButton(
                onPressed: () {
                  deleteData();
                },
                child: const Text('Veri Sil'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    var response = await http.get(Uri.parse('${baseUrl}anime'));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
    } else {
      print('İstek durumu: ${response.statusCode}');
    }
  }

  Future<void> createData() async {
    var requestBody = json.encode({});

    var response = await http.post(
      Uri.parse('${baseUrl}anime'),
      headers: <String, String>{
        'Content-Type': 'application/vnd.api+json',
        'Accept': 'application/vnd.api+json',
      },
      body: requestBody,
    );

    if (response.statusCode == 201) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
    } else {
      print('İstek durumu: ${response.statusCode}');
    }
  }

  Future<void> updateData() async {
    var requestBody = json.encode({});

    var response = await http.put(
      Uri.parse('${baseUrl}anime/1'),
      headers: <String, String>{
        'Content-Type': 'application/vnd.api+json',
        'Accept': 'application/vnd.api+json',
      },
      body: requestBody,
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
    } else {
      print('İstek durumu: ${response.statusCode}');
    }
  }

  Future<void> deleteData() async {
    var response = await http.delete(
      Uri.parse('${baseUrl}anime/1'),
      headers: <String, String>{
        'Content-Type': 'application/vnd.api+json',
        'Accept': 'application/vnd.api+json',
      },
    );

    if (response.statusCode == 204) {
      print('Kayıt başarıyla silindi');
    } else {
      print('İstek durumu: ${response.statusCode}');
    }
  }
}
