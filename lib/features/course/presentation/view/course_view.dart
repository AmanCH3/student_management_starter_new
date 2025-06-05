import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Course name" ,
              border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)
              )
            ),
          ) ,
        SizedBox(height: 10,),

          Container(
            width: double.infinity,
              height: 50,
              child: ElevatedButton(onPressed: (){}, child: Text("Add Course")))

        ],
      ),
    );
  }
}
