import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/home_layout/home_layout.dart';
import 'package:todo/provider/themeProvider.dart';
import 'package:todo/screens/edit_screen.dart';
import 'package:todo/screens/tabs/settings_tab.dart';
import 'package:todo/screens/tabs/tasks_tab.dart';
import 'package:todo/style/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context)=> const HomeScreen(),
        TasksTab.routeName: (context)=> const TasksTab(),
        SettingsTab.routeName: (context)=> const SettingsTab(),
        EditScreen.routeName: (context) => EditScreen(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: themeProvider.themeMode,
    );
  }
}
