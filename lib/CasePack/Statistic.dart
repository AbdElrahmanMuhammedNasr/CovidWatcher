import 'dart:convert';
import 'package:covid19/CasePack/Details.dart';
import 'package:covid19/Common/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Statistic extends StatefulWidget {
  @override
  _StatisticState createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  String totalCase;
  String totalDeath;
  String totalrecovered;
  String newCases;
  String newDeath;

  String activeCases;
  String seriousCritical;
  String totalTests;

  // String _searchKey;

  @override
  void initState() {
    super.initState();
    getDetails("");
  }
  /*********************************************************************************** */

  getDetails(String search) async {
    totalCase = null;
    // print(
    //     '---------------------------------------------------------- ${search}');

    final response = await http.get(
      "https://corona-virus-world-and-india-data.p.rapidapi.com/api",
      headers: {
        "x-rapidapi-host": "corona-virus-world-and-india-data.p.rapidapi.com",
        "x-rapidapi-key": "1729cf9aafmshf367a549de72d3fp15224cjsnecde86e8a0bc",
        "content-type": "application/json",
      },
    );
    /*********************************************************************** */
    if (search.length == 0) {
      search = "world_total";
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          totalCase = responseData[search]["total_cases"];
          totalDeath = responseData[search]["total_deaths"];
          totalrecovered = responseData[search]["total_recovered"];
          newCases = responseData[search]["new_cases"];
          newDeath = responseData[search]["new_deaths"];
          activeCases = responseData[search]["active_cases"];
          seriousCritical = responseData[search]["serious_critical"];
          totalTests = (responseData[search]["serious_critical"] == null)
              ? responseData[search]["serious_critical"]
              : totalCase;
        });
      }
    } else {
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        for (var i in responseData["countries_stat"]) {
          if (i["country_name"].toLowerCase().trim() == search.toLowerCase().trim()) {
            setState(() {
              print(i);
              totalCase = i["cases"];
              totalDeath = i["deaths"];
              totalrecovered = i["total_recovered"];
              newCases = i["new_cases"];
              newDeath = i["new_deaths"];
              activeCases = i["active_cases"];
              seriousCritical = i["serious_critical"];
              totalTests = i["total_tests"];
              print(i["cases"]);
            });
            break;
          }
        }
      }
    }
    // print(
        // '---------------------------------------------------------- ${search}');
  }

  /*********************************************************************************** */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            )),
        child: Container(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.green),
                          border: InputBorder.none,
                          hintText: 'Search'),
                      onSubmitted: (value) {
                        setState(() {
                          // _searchKey = value;
                          getDetails(value);
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            totalCase == null
                ? Loading()
                : Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: <Widget>[
                        DetaisWid("Total Case", totalCase, "airline_seat_flat",
                            "green"),
                        DetaisWid(
                            "New Case", newCases, "airline_seat_flat", "gray"),
                        DetaisWid("Total Deaths", totalDeath,
                            "airline_seat_flat", "red"),
                        DetaisWid(
                            "New Deaths", newDeath, "airline_seat_flat", "red"),
                        DetaisWid("Total Recovered", totalrecovered,
                            "airline_seat_flat", "yellow"),
                        DetaisWid("Total Tests", totalTests,
                            "airline_seat_flat", "yellow"),
                        DetaisWid("Serious critical", seriousCritical,
                            "airline_seat_flat", "yellow"),
                        DetaisWid("Active Cases", activeCases,
                            "airline_seat_flat", "yellow"),
                      ],
                    ),
                  ),
          ],
        )),
      ),
    );
  }
}
