import 'package:flutter/widgets.dart';
import 'package:json_to_flutter/content/content_handler_registry.dart';

class ContentTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, List<String>>>(
      stream: ContentHandlerRegistry.indexUpdateStreamController.stream,
      builder: (BuildContext context,
          AsyncSnapshot<Map<String, List<String>>> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Select a page');
          case ConnectionState.waiting:
            return Text('Loading');
          case ConnectionState.active:
            if (snapshot.data == null) {
              return Text("Loading index");
            }
            List<String> contentIndex = [];
            snapshot.data.keys.forEach((key) {
              contentIndex.addAll(snapshot.data[key]);
            });
            
          
            return Expanded(
              child: 
                ListView.builder(
                  itemBuilder: (BuildContext context, int i) =>
                      Text(contentIndex[i]),
                  itemCount: contentIndex.length,
                )
              
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
