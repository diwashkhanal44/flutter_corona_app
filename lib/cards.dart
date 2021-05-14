import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data.dart';

class Cardss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, data, child) {
        data.getdata();
        data.getCountry();
        return (Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Center(
                          child: Text(
                        'Confirmed',
                        style: TextStyle(color: Colors.purpleAccent),
                      )),
                      subtitle: Center(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                        child: (Text(
                          data.confirmed,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blueAccent),
                        )),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Center(
                          child: Text(
                        'Recovered',
                        style: TextStyle(color: Colors.purpleAccent),
                      )),
                      subtitle: Center(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                        child: (Text(
                          data.recovered,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.greenAccent),
                        )),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Center(
                          child: Text(
                        'Deaths',
                        style: TextStyle(color: Colors.purpleAccent),
                      )),
                      subtitle: Center(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                        child: (Text(
                          data.deaths,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.redAccent),
                        )),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
