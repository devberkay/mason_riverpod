import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:{{app_name.pascalCase()}}/model/provider/router/router.dart';
import 'package:{{app_name.pascalCase()}}/theming.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ProviderScope(child: {{app_name.pascalCase()}}App()));
}

class {{app_name.pascalCase()}}App extends StatefulHookConsumerWidget {
  const {{app_name.pascalCase()}}App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _{{app_name.pascalCase()}}AppState();
}

class _{{app_name.pascalCase()}}AppState extends ConsumerState<{{app_name.pascalCase()}}App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);

    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        backButtonDispatcher: router.backButtonDispatcher,
        theme: Theming.config,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
