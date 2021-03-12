import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  TextStyle _labelStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  TextStyle _valueStyle = TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              buildAboutRow('Author:', 'Vladimir Tomic'),
              buildAboutRow('Year of production:', '2021'),
              buildAboutRow('Application version:', '1.0'),
              buildAboutRow('Made for:', 'OpenIT Conference'),
            ],
          ),
        ),
      ),
    );
  }

  Column buildAboutRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: _labelStyle,
        ),
        Text(
          value,
          style: _valueStyle,
        ),
        Divider(),
      ],
    );
  }
}
