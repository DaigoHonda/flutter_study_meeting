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
        "/second": (context) => SecondPage(),
        "/third": (context) => ThirdPage()
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
            Navigator.pushNamed(context, "/second");
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Second Page')),
        body: Center(
          child: Column(
            children: [
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
              ),
              ElevatedButton(
                child: const Text('pushReplacement'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/third");
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
          child: Column(children: [
        ElevatedButton(
          child: const Text('pop'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: const Text('pushAndRemoveUntil'),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, "/second", ModalRoute.withName('/'));
          },
        ),
        ElevatedButton(
          child: const Text('popUntil'),
          onPressed: () {
            Navigator.popUntil(context,ModalRoute.withName("/"));
          },
        ),
      ])),
    );
  }
}
