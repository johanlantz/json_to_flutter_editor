import 'package:flutter/material.dart';
import 'pages.dart';
import 'package:json_to_flutter/actions/action_handler_nav.dart';
import 'package:json_to_flutter/actions/action_handler_post.dart';
import 'package:json_to_flutter/actions/action_handler_registry.dart';
import 'package:json_to_flutter/json_to_flutter.dart';
import 'package:json_to_flutter/content/content_handler_registry.dart';
import 'package:json_to_flutter/content/content_handler_mem.dart';
import 'package:json_to_flutter/content/content_handler_link.dart';
import 'package:json_to_flutter/builders/builders.dart';

void main() => runApp(MyApp());

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
  contentHandlerLink.registerContent('githubPage1', 'https://raw.githubusercontent.com/johanlantz/pages/master/app1/githubPage1');
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
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[Text("hi")],
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 3.0, color: Colors.black)),
              child: SizedBox(
                  width: 375,
                  height: 667,
                  child: getDynamicPage('firstPage')),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo.',
        routes: {'/': (context) => getOverviewPage()},
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
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
