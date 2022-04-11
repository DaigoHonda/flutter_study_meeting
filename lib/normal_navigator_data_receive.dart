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
              return SecondPage('first pageから開かれました。');
            }));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  // createState()　で"State"（Stateを継承したクラス）を返す
  final String message;

  SecondPage(this.message);

  @override
  _SecondPageState createState() => _SecondPageState(this.message);
}

class _SecondPageState extends State<SecondPage> {
  String message;

  _SecondPageState(this.message);

  void _setMessage(String message) {
    setState(() {
      this.message = message;
    });
  }

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
                child: const Text('open modal'),
                onPressed: () async {
                  var message = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return ThirdPage();
                          },
                          fullscreenDialog: true));
                
                  if(message != null){
                   _setMessage(message); 
                  }
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
            Navigator.pop<String>(context, 'third page から戻りました。');
          },
        ),
      ),
    );
  }
}
