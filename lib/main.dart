import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thiran_tech_task_2/model/repo_hive_model.dart';
import 'package:thiran_tech_task_2/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(GitHubRepoHiveAdapter());
  await Hive.openBox<GitHubRepoHive>('repo');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: const SplashScreen(),
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
      );
  }
}
