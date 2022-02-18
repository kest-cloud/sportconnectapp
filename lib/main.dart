// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportconnectapp/helper/auth.dart';
import 'package:sportconnectapp/screens/buddies.dart';
import 'package:sportconnectapp/screens/discover.dart';
import 'package:sportconnectapp/screens/home.dart';
import 'package:sportconnectapp/screens/interest.dart';
import 'package:sportconnectapp/screens/profile.dart';
import 'package:sportconnectapp/screens/settings.dart';
import 'package:sportconnectapp/screens/splash_screen.dart';
import 'package:sportconnectapp/theme/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'Sport Connect',
        debugShowCheckedModeBanner: false,
        theme: getTheme(),
        themeMode: ThemeMode.dark,
        routes: {
          "/": (_) => SplashScreen(),
          //SplashScreen(),
          "/interest": (_) => InterestScreen(),
          "/home": (_) => HomeScreen(),
          "/profile": (_) => ProfileScreen(),
          "/buddies": (_) => BuddiesScreen(),
          "/discover": (_) => DiscoverScreen(),
          "/settings": (_) => SettingsScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
