import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:seller_app/app/view/app.dart';
import 'package:seller_app/bootstrap.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  unawaited(bootstrap(() => const App()));
}
