import 'package:flutter_web_ui/ui.dart' as ui;
import 'package:json_editor/main.dart' as app;

main() async {
  await ui.webOnlyInitializePlatform();
  app.main();
}