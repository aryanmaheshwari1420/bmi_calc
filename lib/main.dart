import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();

  var result = "";
  var bgcolor = const Color.fromARGB(255, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Your BMI"),
                const SizedBox(height: 11),
                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                    labelText: "Enter your weight (in kgs)",
                    prefixIcon: const Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                    labelText: "Enter your height (in feet)",
                    prefixIcon: const Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: incontroller,
                  decoration: InputDecoration(
                    labelText: "Enter your height (in inches)",
                    prefixIcon: const Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtcontroller.text.toString();
                    var ft = ftcontroller.text.toString();
                    var inch = incontroller.text.toString();

                    if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
                      // BMI Calculator
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (ift * 12) + iInch;

                      var tCm = tInch * 2.54;

                      var tM = tCm / 100;

                      var bmi = iwt / (tM * tM);

                      var msg = "";

                      if (bmi < 25) {
                        msg = "You are overweight";
                        bgcolor = Colors.blueGrey;
                      } else if (bmi < 18.5) {
                        msg = "You are underweight";
                        bgcolor = Colors.orangeAccent;
                      } else {
                        msg = "You are healthy";
                        bgcolor = Colors.white;
                      }

                      setState(() {
                        result =
                            "$msg \nYour BMI is: ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill in all the above details first!";
                      });
                    }
                  },
                  child: const Text("Calculate"),
                ),
                const SizedBox(height: 11),
                Text(
                  result,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
