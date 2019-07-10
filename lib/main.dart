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

Widget getDynamicPage(String contentKey) {
  // Register our action handlers
  var actionHandlerRegistry = ActionHandlerRegistry();
  actionHandlerRegistry.registerActionHandler(ActionHandlerNav());
  actionHandlerRegistry.registerActionHandler(ActionHandlerPost());

  // Register our content handlers
  var contentHandlerRegistry = ContentHandlerRegistry();
  var contentHandlerMem = ContentHandlerMem();
  contentHandlerMem.registerContent('firstPage', firstPage);
  contentHandlerMem.registerContent('firstPage', firstPage);
  contentHandlerMem.registerContent('secondPage', secondPage);
  contentHandlerMem.registerContent('thirdPage', thirdPage);
  contentHandlerMem.registerContent('fourthPage', fourthPage);
  contentHandlerMem.registerContent('fifthPage', fifthPage);
  contentHandlerMem.registerContent('sixthPage', sixthPage);
  contentHandlerMem.registerContent('seventhPage', seventhPage);
  contentHandlerRegistry.registerContentHandler(contentHandlerMem);

  var contentHandlerLink = ContentHandlerLink();
  contentHandlerLink.registerContent('githubPage1',
      'https://raw.githubusercontent.com/johanlantz/pages/master/app1/githubPage1');
  contentHandlerRegistry.registerContentHandler(contentHandlerLink);

  return JSONToFlutter.getPage(
      contentKey, contentHandlerRegistry, actionHandlerRegistry);
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
              builder: (context) => EditorState(getDynamicPage('firstPage'))),
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

class NativePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Splash page'),
        RaisedButton(
          child: Text('Click me to go to jtf page'),
          onPressed: () {
            Navigator.pushNamed(context, 'jtfScreen');
          },
        ),
        RaisedButton(
          child: Text('Click me to go to github page'),
          onPressed: () {
            Navigator.pushNamed(context, 'jtfScreenGithub');
          },
        )
      ],
    );
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
