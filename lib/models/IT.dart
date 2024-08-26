 // ignore_for_file: non_constant_identifier_names, unused_import, prefer_const_constructors

 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ITModel{
   String name;
   String image;
   Color imagebox;
   String category;
   List<String>specialities;
   double score;




   ITModel({
    required this.name,
    required this.image,
    required this.imagebox,
    required this.category,
    required this.specialities,
    required this.score,
   });
   static List<ITModel> getIT(){
     List<ITModel> ITs=[];

     ITs.add(
      ITModel(
        name: "Bibek Bikram Shahi",
        image: "assets/images/bibek.jpg",
        imagebox: const Color.fromARGB(255, 247, 163, 157).withOpacity(0.5),
        category: "Artificial Intelligence",
        specialities:['Machine learning' , 'python' ,' NLP'],
        score: 3.4,
    
      )
     );

          ITs.add(
      ITModel(
        name:"Khushi Khanal",
        image: "assets/images/khushi.jpg",
        imagebox: const Color.fromARGB(255, 157, 247, 244).withOpacity(0.5),
        category: "front end developer",
        specialities:['React','JavaScript','html','css'],
        score:3.0,
    
      )
     );

         ITs.add(
      ITModel(
        name:"Kumar Bhattarai" ,
        image: "assets/images/kumar.jpg",
        imagebox: const Color.fromARGB(255, 247, 163, 157).withOpacity(0.5),
         category:"full stack developer",
        specialities:['React','JavaScript','html','css','node.js'],
        score: 3.1,
    
      )
     );


         ITs.add(
      ITModel(
        name:"Injal Acharya",
        image: "assets/images/injal.jpg",
        imagebox: const Color.fromARGB(255, 247, 163, 157).withOpacity(0.5),
        category:"front end developer",
        specialities:['JavaScript','html','css'],
        score: 3.1,
    
      )
     );


         ITs.add(
      ITModel(
        name:"Animesh Poudel",
        image: "assets/images/Animesh.jpg",
        imagebox: const Color.fromARGB(255, 247, 163, 157).withOpacity(0.5),
        category:"app developer",
        specialities:['dart','flutter'],
        score:2.8,
    
      )
     );


         ITs.add(
      ITModel(
        name:"Anwit Dahal",
        image: "assets/images/anwit.jpg",
        imagebox: const Color.fromARGB(255, 247, 163, 157).withOpacity(0.5),
        category:"backend developer",
        specialities:['React','JavaScript','html','css','node.js'],
        score:3.5,
    
      )
     );


         ITs.add(
      ITModel(
        name: "Bibhab Basnet",
        image: "assets/images/bibhab.jpg",
        imagebox: const Color.fromARGB(255, 247, 163, 157).withOpacity(0.5),
        category:"python developer",
        specialities:['python','sql'],
        score: 3.5,
    
      )
     );
     return ITs;
   }
 }