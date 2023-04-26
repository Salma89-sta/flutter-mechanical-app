import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled9/authentication/ttt.dart';
import 'app.dart';

late AuthenticationMethods authenticationMethods;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  authenticationMethods = AuthenticationMethods();
  runApp( MyApp());
}