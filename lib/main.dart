import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/services/auth/auth_gate.dart';
import 'package:first_app/firebase_options.dart';
import 'package:first_app/model/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:first_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        //theme  er provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),

        //restaurent  er provider
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
