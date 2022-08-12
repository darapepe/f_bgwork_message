import 'package:f_bgwork_message/domain/messages_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';
import 'domain/messages_controller.dart';

void callbackBackgroundWork() async {
  Workmanager().executeTask((taskName, inputData) async {
    //print(DateTime.now());
    MessagesController ctrl = Get.put(MessagesController());
    ctrl.showNotification();
    return Future.value(true);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicio las tareas en segundo plano
  await Workmanager().initialize(callbackBackgroundWork);

  // Registro la tarea
  await Workmanager().registerPeriodicTask("bg-work-1", "print-date-console");

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
      home: const MyHomePage(title: 'Mensajes aleatorios'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Mensajes Aleatorios',
            ),
          ],
        ),
      ),
    );
  }
}
