import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_fetching/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String responseValue = "Click the button to fetch data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Http fetching"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              responseValue,
              maxLines: 20,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                fetchData();
              },
              child: const Icon(
                Icons.done_outline_sharp,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(pathUrl));

      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          responseValue = response.body;
        });
      } else {
        print("Error on server side");
      }
    } catch (error) {
      print("client side error");
    }
  }
}
