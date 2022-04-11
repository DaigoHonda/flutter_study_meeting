import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => FirstPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/second") {
          var message = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return SecondPage(message);
          });
        }
        if (settings.name == "/third") {
          var message = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return ThirdPage();
          });
        }
        return null;
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Center(
        child: ElevatedButton(
          child: const Text('goto second page'),
          onPressed: () {
            Navigator.pushNamed(context, "/second",
                arguments: "first pageからきました");
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String message;

  SecondPage(this.message);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Second Page')),
        body: Center(
          child: Column(
            children: [
              Text(message),
              ElevatedButton(
                child: const Text('goback'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text('goto third page'),
                onPressed: () {
                  Navigator.pushNamed(context, "/third");
                },
              )
            ],
          ),
        ));
  }
}

class ThirdPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third Page')),
      body: Center(
        child: ElevatedButton(
          child: const Text('goback'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
