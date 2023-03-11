import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await Process.run('flutter', ['packages', 'get']);
  try {
    final launcherIcon = context.vars["launcher"] as String? ?? "";
  final splashScreen = context.vars["splash"] as String? ?? "";
  if (launcherIcon.isNotEmpty) {
    final result = await Process.run(
      'flutter',
      ['pub', 'run', 'flutter_launcher_icons'],
    );
    context.logger.info(result.stdout);
    context.logger.info(result.stderr);
  }

  if (splashScreen.isNotEmpty) {
    final result = await Process.run(
      'flutter',
      ['pub', 'run', 'flutter_native_splash:create'],
    );
    context.logger.info(result.stdout);
    context.logger.info(result.stderr);
  }
  }
  catch (e) {

  }
}
