import 'package:flutter/material.dart';
import 'normal_navigator.dart' as NormalNavigation;
import 'normal_navigator_data_receive.dart' as NormalNavigationDataReceive;
import 'named_navigator.dart' as NamedNavigation;
import 'named_navigator_data_receive.dart' as NamedNavigationDataReceive;
import 'ongenerate_route_navigation.dart' as OnGenerateRouteNavigation;
import 'navigator_method.dart' as NavigationMethod;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('First Page')),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: const Text('1番簡単なナビゲーション'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NormalNavigation.FirstPage();
                  }));
                },
              ),
              ElevatedButton(
                  child: const Text('ナビゲーションにデータを渡す'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NormalNavigationDataReceive.FirstPage();
                    }));
                  }),
              ElevatedButton(
                  child: const Text('Named ナビゲーション'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NamedNavigation.MyApp();
                    }));
                  }),
              ElevatedButton(
                  child: const Text('Named ナビゲーションにデータを渡す'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NamedNavigationDataReceive.MyApp();
                    }));
                  }),
              ElevatedButton(
                  child: const Text('onGenerateRoute　ナビゲーション'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return OnGenerateRouteNavigation.MyApp();
                    }));
                  }),
              ElevatedButton(
                  child: const Text('いろいろなナビゲーション method'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NavigationMethod.MyApp();
                    }));
                  })
            ],
          ),
        ));
  }
}
