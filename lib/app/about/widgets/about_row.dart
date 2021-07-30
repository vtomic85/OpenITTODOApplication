import 'package:flutter/material.dart';
import 'package:todo_tracker/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutRow extends StatelessWidget {
  final String label;
  final String value;
  final String url;

  const AboutRow({
    Key? key,
    required this.label,
    required this.value,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Styles.LABEL_TEXT,
        ),
        InkWell(
          child: Text(
            value,
            style: url == '' ? Styles.VALUE_TEXT : Styles.LINK,
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
