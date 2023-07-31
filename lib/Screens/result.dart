import 'package:flutter/material.dart';
 
class Result extends StatelessWidget {
  bool gender = true;
  double result = 0.0;
  List<String> healthiness = [];
  int age = 0;
  Result(this.gender, this.result, this.healthiness, this.age);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("The Results")),
      body: Container(
          child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Gender: ${gender ? "Male" : "Female"} " , style: Theme.of(context).textTheme.headline2,),
              Text("BMI Result:${result.toStringAsFixed(1)}", style: Theme.of(context).textTheme.headline2,),
     
              Text("Age:${age}", style: Theme.of(context).textTheme.headline2,),
            ]),
      )),
    );
  }
}
