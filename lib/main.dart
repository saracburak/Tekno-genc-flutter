import 'package:flutter/material.dart';
import 'package:productorder/model/cart_model.dart';
import 'package:provider/provider.dart';
import 'pages/intro_screen.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import this for User type
import 'package:productorder/service/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        Provider(create: (context) => Auth()), // Provide Auth service
      ],
      child: Consumer<Auth>(
        builder: (context, auth, child) {
          return StreamBuilder<User?>(
            stream: auth.authStateChanges,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: "Order Product",
                    home: IntroScreen(),
                  );
                } else {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: "Order Product",
                    home: LoginPage(),
                  );
                }
              } else {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "Order Product",
                  home: Center(child: CircularProgressIndicator()),
                );
              }
            },
          );
        },
      ),
    );
  }
}
