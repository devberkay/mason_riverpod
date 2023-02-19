import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  // TODO: add pre-generation logic.

  final app_name = context.vars['app_name'] as String;

  final resultBundle = await Process.run("flutter", [
    "pub",
    "global",
    "run",
    "rename",
    "--bundleId",
    "${context.vars['org_name']}.${context.vars['app_name']}",
  ]);
  final resultAppname = await Process.run("flutter",
      ["pub", "global", "run", "rename", "--appname", "${app_name.pascalCase}"]);
    context.logger.info(resultBundle.stdout);
    context.logger.info(resultBundle.stderr);
    context.logger.info(resultAppname.stderr);
    context.logger.info(resultAppname.stdout);
    
}
