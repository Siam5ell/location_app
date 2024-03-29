import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:location_app/firebase_options.dart';
import 'package:location_app/screens/wrapper.dart';
import 'package:location_app/services/auth.dart';
import 'package:location_app/services/determinepositon.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LocationTracker()),
      StreamProvider(
          create: (context) {
            return Authenticate().user;
          },
          initialData: null)
    ], child: const Wrapper());
  }
}
