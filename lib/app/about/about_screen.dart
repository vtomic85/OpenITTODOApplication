import 'package:flutter/material.dart';
import 'package:todo_tracker/app/about/widgets/about_row.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              AboutRow(
                  label: 'Authors:',
                  value: 'Dusan Milosevic & Vladimir Tomic',
                  url: ''),
              AboutRow(
                  label: 'Company:',
                  value: 'Zühlke Engineering',
                  url: 'https://www.zuehlke.com'),
              AboutRow(label: 'Year of production:', value: '2021', url: ''),
              AboutRow(label: 'Application version:', value: '1.0', url: ''),
              AboutRow(label: 'Made for:', value: 'ZRS Camp', url: ''),
            ],
          ),
        ),
      ),
    );
  }
}
