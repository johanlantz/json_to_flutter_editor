import 'package:flutter_web/material.dart';
import 'package:json_editor/pages.dart';
import 'package:json_to_flutter/builders/builders.dart';
import 'package:json_to_flutter/json_to_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 

  MyApp() {
    contentRegistry.registerContent("firstPage", firstPage);
    contentRegistry.registerContent("firstPage", firstPage );
    contentRegistry.registerContent("secondPage", secondPage );
    contentRegistry.registerContent("thirdPage", thirdPage );
    contentRegistry.registerContent("fourthPage", fourthPage );
    contentRegistry.registerContent("fifthPage", fifthPage );
    contentRegistry.registerContent("sixthPage", sixthPage );
    contentRegistry.registerContent("seventhPage", seventhPage );
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
                  child: JSONToFlutter.getPage('firstPage', contentRegistry)),
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

class NativePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('This is a native page'),
        RaisedButton(
          child: Text('Click me to go to jtf page'),
          onPressed: () {
            Navigator.pushNamed(context, 'jtfScreen');
          },
        )
      ],
    );
  }
}

class NativePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('This is native page 2'),
        RaisedButton(
          child: Text('Click me to go to jtf'),
          onPressed: () {
            Navigator.pushNamed(context, 'jtfScreen');
          },
        )
      ],
    );
  }
}

class NativePage3 extends StatefulWidget {
  @override
  _NativePage3State createState() => _NativePage3State();
}

class _NativePage3State extends State<NativePage3> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  didPopRoute() {
    return new Future<bool>.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Column(
        children: <Widget>[
          Text('This is native page 3'),
          RaisedButton(
            child: Text('Click me to go to jtf second page'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          JSONToFlutter.getPage('secondPage', contentRegistry)));
              // Navigator.pushNamed(context, 'jtfScreen');
            },
          )
        ],
      ),
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
