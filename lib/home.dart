// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Color.fromARGB(255, 56, 18, 62),
        height: 350 ,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi user!',
            style:TextStyle(
              color: Colors.white,
              fontSize: 18
            ),),
             SizedBox(height: 16,),
            Text("let's find\nbest IT proffesionals",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight :FontWeight.bold,
            ),),
            SizedBox(height: 56,),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search,
                color: Colors.black,
                size: 25,),
                hintText: "search here",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(60))
                  
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}