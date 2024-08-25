// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_firstapp/models/categories.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final List<CategoryModel> categoriedata =CategoryModel.getcategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          categories(),
        ],
      ),
    );
  }

  Widget categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
          ),
          child: Text(
          'Categories',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),),
        ),
        
       Container(
        height: 50,
        margin: EdgeInsets.all(16),
         child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder:(context, index) 
          {
            return Container(
              height: 50,
              width: 50,
              child: SvgPicture.asset(categoriedata[index].vector),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: categoriedata[index].isselected ? 
                    Colors.purple : Colors.black12,
                    offset: Offset(0, 4),
                    blurRadius: 25,
                  )
                ],
                color: categoriedata[index].isselected ?
                 Color.fromARGB(255, 97, 36, 108) : Colors.white,
              ),
            );
           
         }, 
         separatorBuilder:(context, index) => const SizedBox(width: 80,), 
         itemCount :categoriedata.length),
       )
      ],
    );
  }

  Container header() {
    return Container(
      color: Color.fromARGB(255, 56, 18, 62),
      height: 350 ,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hi user!',
              style:TextStyle(
                color: Colors.white,
                fontSize: 18
              ),),
              
              Container(
                 height: 50,
                 width: 50,
                  padding: EdgeInsets.all(11),
                 child:SvgPicture.asset(
                  'assets/vectors/notification.svg',
                  fit: BoxFit.contain,
                 ),
                 decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.07    ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                 ),
              )
            ],
          ),
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
                borderRadius: BorderRadius.all(Radius.circular(50))
                
              )
            ),
          )
        ],
      ),
    );
  }
}