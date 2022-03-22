import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/fitnessapp_models.dart';
import 'package:flutter_application_1/models/fitnessapp_models.dart';
import 'dart:convert';
import 'package:http/http.dart ' as http;
import '../services/api_int.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  //late Future<ExerciseHub> exerhub;
  var exerhub = ExerciseHub();
  //late ExerciseHub exerhub;

  @override
  void initState() {
    super.initState();
    fetchdata();
    setState(() {});
  }

  void fetchdata() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var body = response.body;
      var json = jsonDecode(body);
      exerhub = ExerciseHub.fromJson(json);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: exerhub != null
            ? ListView.builder(
                itemCount: exerhub.exercises?.length,
                itemBuilder: ((context, index) {
                  return Container(
                    child: Text("Obaid"),
                  );
                }))
            : LinearProgressIndicator(),
      ),
    );
  }
}
