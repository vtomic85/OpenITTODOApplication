import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  TextStyle _labelStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  TextStyle _valueStyle = TextStyle(fontSize: 24);
  TextStyle _linkStyle = TextStyle(
    fontSize: 24,
    decoration: TextDecoration.underline,
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              buildAboutRow('Author:', 'Vladimir Tomic', ''),
              buildAboutRow('Company:', 'Zühlke Engineering', 'https://www.zuehlke.com'),
              buildAboutRow('Year of production:', '2021', ''),
              buildAboutRow('Application version:', '1.0', ''),
              buildAboutRow(
                  'Made for:', 'OpenIT Conference', 'https://open-it.rs/'),
            ],
          ),
        ),
      ),
    );
  }

  Column buildAboutRow(String label, String value, String url) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: _labelStyle,
        ),
        InkWell(
          child: Text(
            value,
            style: url == '' ? _valueStyle : _linkStyle,
          ),
          onTap: url == ''
              ? null
              : () {
                  launch(url);
                },
        ),
        Divider(),
      ],
    );
  }
}
