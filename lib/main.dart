import 'package:dewey/screens/auth/account.dart';
import 'package:dewey/screens/auth/login.dart';
import 'package:dewey/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  const bool isDev = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: isDev
        // ignore: dead_code
        ? "http://carbon.local:54321"
        // ignore: dead_code
        : "https://ntqahcywafcfowvatmxg.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im50cWFoY3l3YWZjZm93dmF0bXhnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODcyMjU3NDAsImV4cCI6MjAwMjgwMTc0MH0.tiRhOz6HhwfhLPdW-S5L2GENzdInEfnt3BUypD7z8Lw",
    authFlowType: AuthFlowType.pkce,
  );
  OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.debug);
  OneSignal.shared.setAppId("6fa5f83a-0482-408b-94fe-0a3406ebfdd5");
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dewey",
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/account': (context) => const AccountPage(),
      },
    );
  }
}
