import 'package:flutter/material.dart';
import 'package:gofit/screens/workout_tracker/workout_detail_view.dart';
import 'package:gofit/screens/workout_tracker/yoga.dart';
import '../../common/colo_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/tab_button.dart';
import 'AdvancedExercises.dart';
import 'BeginnerExercises.dart';
import 'IntermediateExercises.dart';

class ExerciseView extends StatefulWidget {
  const ExerciseView({super.key});

  @override
  State<ExerciseView> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> {
  int isActiveTab = 0;

  List workArr = [
    {
      "name": "Cardio Exercises",
      "image": "assets/img/1.png",
      "title": "workout",
    },
    {
      "name": "Strengths Training",
      "image": "assets/img/2.png",
      "title": "workout",
    },
    {
      "name": "Aerobic Exercises",
      "image": "assets/img/5.png",
      "title": "workout",
    },
    {
      "name": "Weight Lifting Exercises",
      "image": "assets/img/3.png",
      "title": "workout",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,

        title: Text(
          "Free Exercise",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 22,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: TColor.white,
              boxShadow: const  [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                  offset: Offset(0, -2)

                )
              ]
            ),
                  ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                itemCount: workArr.length,
                itemBuilder: (context, index) {
                  var wObj = workArr[index] as Map? ?? {};
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: media.width * 0.5,
                    decoration: BoxDecoration(
                        color: TColor.gray,
                        borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Image.asset(
                          wObj["image"].toString(),
                          width: media.width,
                          height: media.width * 0.5,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: media.width,
                          height: media.width * 0.5,
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.black.withOpacity(0.7)
                                : TColor.gray.withOpacity(0.35),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wObj["title"],
                                style: TextStyle(
                                    color: TColor.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                wObj["name"],
                                style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),

                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      width: 100,
                                      height: 25,
                                      child: RoundButton(
                                        title: "see more",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        onPressed: () {
                                          if( wObj["name"].toString()=='Cardio Exercises'){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    const AdvancedExercises()));}


                                          else   if( wObj["name"].toString()=='Aerobic Exercises'){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    const BeginnerExercises()));}



                                          else   if( wObj["name"].toString()=='Strengths Training'){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    const IntermediateExercises()));}
                                          else   if( wObj["name"].toString()=='Weight Lifting Exercises'){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    const YogaExercises()));}




                                        },
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),

    );
  }
}
