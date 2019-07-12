import 'package:flutter/material.dart';
import 'package:json_to_flutter/actions/action_handler_nav.dart';
import 'package:json_to_flutter/actions/action_handler_post.dart';
import 'package:json_to_flutter/actions/action_handler_registry.dart';
import 'package:json_to_flutter/content/content_handler_link.dart';
import 'package:json_to_flutter/content/content_handler_mem.dart';
import 'package:json_to_flutter/content/content_handler_registry.dart';
import 'package:json_to_flutter/json_to_flutter.dart';

import 'pages.dart';


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


class EditorState with ChangeNotifier {
  Widget dynamicPage = getDynamicPage('firstPage');
  
  EditorState();

  
  setDynamicPage(String contentKey) {
    this.dynamicPage = getDynamicPage(contentKey);
    notifyListeners();
  }
}
