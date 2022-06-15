import 'package:flutter/material.dart';
import 'color_data.dart';

// ignore: must_be_immutable
class ColorDataList extends StatelessWidget {
  ColorDataList({Key? key, required this.colorData}) : super(key: key);
  List<ColorData> colorData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: colorData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('ID:' + colorData[index].id.toString()),
                    Text('NAME:' + colorData[index].name),
                    Text('COLOR:' + colorData[index].color),
                    Text('YEAR:' + colorData[index].year.toString()),
                    Text('PANTONE VALUE:' + colorData[index].pantoneValue),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
