import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../editor_state.dart';

class Preview extends StatefulWidget {
  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  Map<String, List<int>> resolutions = {
    'Galaxy S5': [360, 640],
    'Pixel 2': [411, 731],
    'iPhone 5/SE': [375, 667],
    'iPhone 6/7/8': [375, 667],
    'iPhone 6/7/8 Plus': [414, 736],
    'iPhone X': [375, 812],
    'iPad': [768, 1024]
  };
  String resolutionDropdownValue;

  _PreviewState() {
    resolutionDropdownValue = resolutions.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    var editorState = Provider.of<EditorState>(context);
    return Column(
      children: <Widget>[
        Container(margin: EdgeInsets.only(top: 15),),
        DropdownButton<String>(
          value: resolutionDropdownValue,
          onChanged: (String newValue) {
            setState(() {
              resolutionDropdownValue = newValue;
            });
          },
          items:
              resolutions.keys.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.0),
              border: Border.all(width: 3.0, color: Colors.black)),
          child: SizedBox(
              width: resolutions[resolutionDropdownValue][0].toDouble(),
              height: resolutions[resolutionDropdownValue][1].toDouble(),
              child: editorState.dynamicPage),
        ),
      ],
    );
  }
}
