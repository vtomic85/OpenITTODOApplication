import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TODO app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text('TODO'),
          ),
          body: Column(
            children: [
              const TextField(),
              const ElevatedButton(
                onPressed: null,
                child: Text('Add TODO item'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 300,
                  itemBuilder: (context, index) {
                    return const Padding(
                        padding: EdgeInsets.fromLTRB(0, 1.0, 0, 0),
                        child: Text("TodoItem(index)"));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
