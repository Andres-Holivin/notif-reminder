import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:idg/application/config/theme.dart';
import 'package:idg/application/dependency/setup_locator.dart';
import 'package:idg/application/router/root_router.dart';
import 'package:idg/presentation/state/note/note_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => NoteBloc())],
        child: MaterialApp.router(
            title: "IDG",
            routerConfig: getIt<RootRouter>().router,
            theme: themeData()));
  }
}
