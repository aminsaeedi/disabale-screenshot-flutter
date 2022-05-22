import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _secureMode = false;
  String on= 'on';
  String off='off';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('disable screenshot'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              (_secureMode)?Text('Security mode: $on'):Text('Security mode: $off'),
            
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            onPrimary: Colors.white,
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                            side: const BorderSide(color: Colors.black12, width: .5),
                          ),
                  onPressed: () async {
                    final secureModeToggle = !_secureMode;

                    if (secureModeToggle == true) {
                      await FlutterWindowManager.addFlags(
                          FlutterWindowManager.FLAG_SECURE);
                    } else {
                      await FlutterWindowManager.clearFlags(
                          FlutterWindowManager.FLAG_SECURE);
                    }

                    setState(() {
                      _secureMode = !_secureMode;
                    });
                  },
                  child: const Text("Change security mode",style: TextStyle(color: Colors.black),)),
            ],
          ),
        ),
      ),
    );
  }
}