import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:padavukal/core/providers/auth_provider.dart';
import 'package:padavukal/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ],
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Padavukal',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Wrapper(),
          );
        });
  }
}
