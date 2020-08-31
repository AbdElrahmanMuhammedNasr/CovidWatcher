import 'package:covid19/main.dart';
import 'package:flutter/material.dart';

class ProdectMethod extends StatefulWidget {
  @override
  _ProdectMethodState createState() => _ProdectMethodState();
}

class _ProdectMethodState extends State<ProdectMethod> {
  final List<Map<String, dynamic>> method = [
    {"image": "fever", "name": "Fever"},
    {"image": "cough", "name": "Dry cough"},
    {"image": "tired", "name": "Tiredness"},
  ];
  final List<Map<String, dynamic>> method2 = [
    {"name": "aches and pains"},
    {"name": "sore throat"},
    {"name": "diarrhoea"},
    {"name": "conjunctivitis"},
    {"name": "headache"},
    {"name": "loss of taste or smell"},
    {"name": "rash on skin"},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Covid-19",
              style: TextStyle(color: Colors.green),
            ),
            elevation: 0,
            backgroundColor: Colors.grey[200],
            actions: [
              IconButton(
                  icon: Icon(Icons.home, color: Colors.green),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp(),));
                  })
            ],
            bottom: TabBar(
              indicatorColor: Colors.green,
              labelColor: Colors.green,
              tabs: [
                Tab(
                  text: "Symptoms",
                ),
                Tab(
                  text: "Provention",
                ),
              ],
            ),
          ),
          body: Container(
            child: TabBarView(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Most Common',
                        style:
                            TextStyle(fontSize: 25, color: Colors.green),
                      ),
                      Column(
                        children: method
                            .map((e) => Det(e["image"], e["name"]))
                            .toList(),
                      ),
                      Text(
                        'Less Common',
                        style:
                            TextStyle(fontSize: 25, color: Colors.green),
                      ),
                      Column(
                        children: method2.map((e) => Det2(e["name"])).toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                       SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("images/mask.png"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("images/wash.png"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("images/queue.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget Det(image, name) {
  return Container(
    margin: EdgeInsets.all(20),
    child: Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("images/${image}.png"),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          '${name}',
          style: TextStyle(fontSize: 25),
        ),
      ],
    ),
  );
}

Widget Det2(
  name,
) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Text(
          '${name}',
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
  );
}
