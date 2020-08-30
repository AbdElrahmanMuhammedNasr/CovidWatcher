import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DetaisWid extends StatelessWidget {
  String name;
  String number;
  String icon;
  String color;

  DetaisWid(this.name, this.number, this.icon, this.color) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Icon(
                //   Icons.airline_seat_flat,
                //   color: Colors.amber,
                // ),
                // SizedBox(
                //   width: 10,
                // ),
                Text('${name}')
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${number}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                // Container(
                //   width: 110,
                //   height: 50,
                //   child: LineChart(LineChartData(
                //       gridData: FlGridData(show: false),
                //       titlesData: FlTitlesData(show: false),
                //       borderData: FlBorderData(show: false),
                //       lineBarsData: [
                //         LineChartBarData(
                //             spots: getSpots(),
                //             isCurved: true,
                //             dotData: FlDotData(show: false),
                //             belowBarData: BarAreaData(show: false),
                //             barWidth: 4,
                //             colors: [Colors.green])
                //       ])),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// List<FlSpot> getSpots() {
//   return [
//     FlSpot(0, 0),
//     FlSpot(1, .5),
//     FlSpot(2, 1),
//     FlSpot(3, 1.2),
//     FlSpot(4, 1.5),
//     FlSpot(5, 2),
//     FlSpot(6, 3),
//     FlSpot(7, 7),
//     FlSpot(8, 8),
//     FlSpot(9, 9),
//     FlSpot(10, 1.5),
//     FlSpot(11, 2),
//     FlSpot(12, 3),
//     FlSpot(13, 7),
//     FlSpot(14, 8),
//     FlSpot(15, 9),
//   ];
// }
