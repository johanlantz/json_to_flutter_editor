import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_to_flutter_editor/components/content_tree.dart';
import 'package:json_to_flutter_editor/components/raw_editor.dart';
import 'components/preview.dart';
import 'editor_state.dart';
import 'pages.dart';
import 'package:json_to_flutter/actions/action_handler_nav.dart';
import 'package:json_to_flutter/actions/action_handler_post.dart';
import 'package:json_to_flutter/actions/action_handler_registry.dart';
import 'package:json_to_flutter/json_to_flutter.dart';
import 'package:json_to_flutter/content/content_handler_registry.dart';
import 'package:json_to_flutter/content/content_handler_mem.dart';
import 'package:json_to_flutter/content/content_handler_link.dart';
import 'package:json_to_flutter/builders/builders.dart';
import 'package:provider/provider.dart';


void main() {
  // Enable fullscreen (not 100% ok, when keyboard has show it reappears)
  SystemChrome.setEnabledSystemUIOverlays([]);
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
  MyApp() {
    registerExternalWidget("ExternalWidget", ExternalWidgetBuilder());
    //registerExternalWidget('TouchRecorder', TouchRecorderBuilder());
  }

  Widget getOverviewPage() {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            child: ContentTree(),
          ),
          Expanded(child: Container(
            width: 400,
            child:  RawEditor()
          )),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Preview(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<EditorState>(
              builder: (context) => EditorState()),
        ],
        child: MaterialApp(
            title: 'Flutter Demo.',
            routes: {
              '/': (context) => getOverviewPage(),
              },
            theme: ThemeData(
              primarySwatch: Colors.blue,
            )));
  }
}

// If it complains here most likely we are mixing flutter_web/material with normal flutter/material
class ExternalWidgetBuilder with WidgetBuilderBase {
  @override
  Widget build(BuildContext context) {
    return ExternalWidget();
  }
}

class ExternalWidget extends StatefulWidget {
  @override
  _ExternalWidgetState createState() => _ExternalWidgetState();
}

class _ExternalWidgetState extends State<ExternalWidget> {
  @override
  Widget build(BuildContext context) {
    return Text("hello world from an external widget");
  }
}

// class TouchRecorderBuilder with WidgetBuilderBase {
//   @override
//   Widget build(BuildContext context) {
//    return TouchRecorder();
//   }
// }
