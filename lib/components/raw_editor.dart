import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_to_flutter/content/content_handler_registry.dart';

class RawEditor extends StatefulWidget {
  @override
  _RawEditorState createState() => _RawEditorState();
}

class _RawEditorState extends State<RawEditor> {
  Map<String, Map<String, dynamic>> content;
  List<String> _contentWip = [];

  var _controller = TextEditingController();
  String jsonValidationErrorMessage = "";

  _validateJson(String updatedJson) {
    JsonDecoder decoder = JsonDecoder();
    try {
      decoder.convert(updatedJson);
      print('Updated data is valid json.');
      jsonValidationErrorMessage = "";
      return true;
    } on FormatException catch (e) {
      _controller.selection =
          TextSelection(baseOffset: e.offset, extentOffset: e.offset - 20);
          jsonValidationErrorMessage = 'Invalid json string at offset ${e.offset}';
          return false;
    }
  }

  _updateContent(String updatedJson) {
    _contentWip = [];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, Map<String, dynamic>>>(
      stream: ContentHandlerRegistry.currentContentStreamController.stream,
      builder: (BuildContext context,
          AsyncSnapshot<Map<String, Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Select a page');
          case ConnectionState.waiting:
            return Text('Loading');
          case ConnectionState.active:
            content = snapshot.data;
            JsonEncoder encoder = JsonEncoder.withIndent('  ');
            if (_contentWip.length > 0) {
              _controller.text = _contentWip.last;
            } else {
              _controller.text = encoder.convert(content[content.keys.first]);
            }
            return Column(
              children: <Widget>[
                Row(children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.check),
                    color: Colors.green,
                    onPressed: _validateJson(_controller.text) == false ? null : () {
                      _updateContent(_controller.text);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.undo),
                    color: Colors.red,
                    onPressed: _contentWip.length == 0
                        ? null
                        : () {
                            setState(() {
                              _contentWip.removeLast();
                            });
                          },
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel),
                    color: Colors.red,
                    onPressed: _contentWip.length == 0
                        ? null
                        : () {
                            setState(() {
                              _contentWip = [];
                            });
                          },
                  )
                ]),
                Row(children: <Widget>[
                  Visibility(
                    visible: jsonValidationErrorMessage.length > 0,
                    child: Text(jsonValidationErrorMessage, style: TextStyle(color: Colors.red)))
                ]),
                Expanded(
                    child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (data) {
                          setState(() {
                            _contentWip.add(data);
                          });
                        })),
              ],
            );

          case ConnectionState.done:
            return Text('done');
          default:
            return Text('Unknown stream connectionState');
        }
      },
    );
  }
}
