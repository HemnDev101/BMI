import 'dart:math';

import 'package:bmi2/Screens/result.dart';
import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double bmi(double height, weight) {
    return weight / pow(height / 100, 2);
  }

  bool? isMale =true;
  int age = 18;
  int weight = 55;
  double height = 165;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Body Mass index",
            )),
        body: SafeArea(
          child: Column(
            children: [
              //bashi sarawa
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        m1Expanded("male"),
                        SizedBox(
                          width: 15,
                        ),
                        m1Expanded("female"),
                      ]),
                ),
              ),

//bashi nawarast
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        m3Expanded("male"),
                      ]),
                ),
              ),

//bashi xwarawa
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        m2Expanded("weight"),
                        SizedBox(
                          width: 15,
                        ),
                        m2Expanded("age"),
                      ]),
                ),
              ),

              Container(
                  color: Colors.teal,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 16,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Result(isMale==true, bmi(height, weight), [], age),
                            ));
                      },
                      child: Text(
                        "Calculate",
                        style: Theme.of(context).textTheme.headline2,
                      )))
            ],
          ),
        ),
      ),
    );
  }

  Expanded m1Expanded(String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            type == "male" ? isMale = true : isMale = false;
            print(isMale);
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: (isMale == true && type == "male") ||
                      (isMale == false && type == "female")
                  ? Colors.teal
                  : Colors.blueGrey,
              borderRadius: BorderRadius.circular(10)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              type == "male" ? Icons.male : Icons.female,
              size: 70,
              color: Colors.white,
            ),
            Text(
              type == 'male' ? "Male" : "Female",
              style: Theme.of(context).textTheme.headline2,
            ),
          ]),
        ),
      ),
    );
  }

  Expanded m2Expanded(String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: (isMale == true && type == "male") ||
                    (isMale == false && type == "female")
                ? Colors.teal
                : Colors.blueGrey,
            borderRadius: BorderRadius.circular(10)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            type == 'age' ? "age" : "Weight",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            type == 'age' ? "$age" : "$weight",
            style: Theme.of(context).textTheme.headline1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: type == "age" ? "age--" : "weight--",
                mini: true,
                onPressed: () {
                  setState(() {
                    type == "age" ? age-- : weight--;
                    print(age);
                  });
                },
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: type == "age" ? "age++" : "weight++",
                mini: true,
                onPressed: () {
                  setState(() {
                    type == "age" ? age++ : weight++;
                    print(age);
                  });
                },
                child: Icon(Icons.add),
              ),
            ],
          )
        ]),
      ),
    );
  }

  Expanded m3Expanded(String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Height",
            style: Theme.of(context).textTheme.headline2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                height.toStringAsFixed(1),
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                "CM",
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
          Slider(
              thumbColor: Colors.black,
              activeColor: Colors.black,
              inactiveColor: Colors.white,
              min: 65,
              max: 220,
              value: height,
              onChanged: (newVal) {
                setState(() {
                  height = newVal;
                });
              })
        ]),
      ),
    );
  }

/*
  setData()   {
    setState(()  async{
       SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("Gender", "Male");
    _pref.setInt("Result", 73);
    _pref.setStringList(
        "Healthniness", ["Ovese", "Overweight", "Normal", "Thin"]);
    _pref.setInt("Age", 24);
    });
   
  }*/
}
