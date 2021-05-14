import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data.dart';

class Selectorr extends StatefulWidget {
  @override
  _SelectorrState createState() => _SelectorrState();
}

class _SelectorrState extends State<Selectorr> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, data, child) {
        return DropdownButton<String>(
          hint: Text('select a  country'),
          icon: const Icon(Icons.arrow_downward),
          iconSize: 40,
          elevation: 16,
          onChanged: (String newValue) {
            setState(() {
              data.country = newValue;
            });
          },
          items: data.countryNames.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}
