import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:provider/provider.dart';
import 'cards.dart';
import 'selector.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Corona App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CheckConnection(),
      ),
    );
  }
}

class CheckConnection extends StatefulWidget {
  @override
  CheckCOnnectionState createState() => CheckCOnnectionState();
}

class CheckCOnnectionState extends State<CheckConnection> {
  ConnectivityResult connectivityResult = ConnectivityResult.none;
  bool flag = false;
  @override
  void initState() {
    super.initState();
    isConnected();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: connectivityResult == ConnectivityResult.wifi
            ? MyHomePage()
            : connectivityResult == ConnectivityResult.mobile
                ? MyHomePage()
                : NoConnection());
  }

  Future isConnected() async {
    var result = await Connectivity().checkConnectivity();
    setState(() {
      connectivityResult = result;
    });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<Data>(builder: (context, data, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 40, 5, 1),
              child: Container(
                height: MediaQuery.of(context).size.height / 8,
                child: Text(
                  data.country.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.purpleAccent),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                child: Cardss(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: MediaQuery.of(context).size.height / 6,
                child: SingleChildScrollView(
                  child: Selectorr(),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class NoConnection extends StatefulWidget {
  @override
  _NoConnectionState createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('check your internet connection'),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            child: Text('Reload'),
            onPressed: () {
              CheckConnection();
            },
          ),
        )
      ],
    );
  }
}
