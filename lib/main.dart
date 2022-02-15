import 'package:exemplo39/paginicio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()
//informando q o proximo parametro sera assincrono
async {
  //fazendo a inicializacao do firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //informando q a pagina inicial é o q esta na funcao inicio
      home: inicio(),
    );
  }
}
