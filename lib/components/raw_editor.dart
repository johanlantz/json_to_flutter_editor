import 'package:flutter/material.dart';
import 'package:json_to_flutter/content/content_handler_registry.dart';

class RawEditor extends StatefulWidget {
  @override
  _RawEditorState createState() => _RawEditorState();
}

class _RawEditorState extends State<RawEditor> {
  Map<String, Map<String, dynamic>> content;
  var _controller = TextEditingController();

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
            _controller.text = content[content.keys.first].toString();

            return Column(
              children: <Widget>[
                Row(children: <Widget>[
                 IconButton(
                    icon: Icon(Icons.check),
                    color: Colors.green,
                    onPressed: () {},
                  ),
                   IconButton(
                    icon: Icon(Icons.cancel),
                    color: Colors.red,
                    onPressed: () {},
                  )
                ]),
                Expanded(
                    child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onSubmitted: (data) {
                          print('new json is $data');
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
