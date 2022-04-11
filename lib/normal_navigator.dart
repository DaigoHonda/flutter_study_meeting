import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Center(
        child: ElevatedButton(
          child: const Text('goto second page'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondPage();
            }));
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
                child: const Text('open modal'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ThirdPage();
                  },fullscreenDialog: true));
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
          child: const Text('close'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
