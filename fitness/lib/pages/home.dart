// ignore_for_file: sort_child_properties_last

import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_modal.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <CategoryModal> categories = [];
  List <DietModel> diet = [];
  List <PopularDietModel> populardiets = [];

  void _getCategories() {
    categories = CategoryModal.getCategories();
  }

  void _getdiet() {
    diet = DietModel.getDiets();
  }

  void _getPopulardiets() {
    populardiets = PopularDietModel.getPopularDiets();
  }

  @override
  void initState() async {
    super.initState();

    _getCategories();
    _getdiet();
    _getPopulardiets();
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [   
          _searchField(),
          const SizedBox(height: 40,),
          _categoriesSection(),
          const SizedBox(height: 40,),
          _dietSection(),
          const SizedBox(height: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),  
              ),const SizedBox(height: 15,),
              ListView.separated(
                 separatorBuilder:(context, index) => const SizedBox(height: 25,),
                  itemCount: populardiets.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      
                      height: 115,
                      child: Row(
                        children: [
                          SvgPicture.asset(populardiets[index].iconPath,
                          height: 65,
                          width: 65,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(populardiets[index].name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              ),
                              Text(
                                '${populardiets[index].level} | ${populardiets[index].duration} | ${populardiets[index].calorie}',
                                style: const TextStyle(
                                  color: Color(0xff7B6F72),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset('assets/icons/button.svg',
                          height: 30,
                          width: 30,),
                          )
                        ]),
                      decoration: BoxDecoration(
                        color: populardiets[index].boxIsSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: populardiets[index].boxIsSelected ? [
                          BoxShadow(
                            color: const Color(0xff1D1617).withOpacity(0.07),
                            offset: const Offset(0, 10),
                            blurRadius: 40,
                            spreadRadius: 0,
                          )
                        ] : []
                      ),

                    ); 
                  },
                  )
            ],
          ),
          const SizedBox(height: 40,)
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Recommendation\nfor Diet',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black,
              ),
              ),
            ),
            const SizedBox( height: 15,),
            Container(
              color: Colors.blue,
              height: 240,
              child: ListView.separated(
                itemBuilder:(context, index) {
                  return Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: diet[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(diet[index].iconPath),
                        Text(diet[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color:  Colors.black,
                          fontSize: 16,
                        ),
                        ),
                        Text('${diet[index].level} | ${diet[index].duration} | ${diet[index].calorie}',
                        style: const TextStyle(
                          color: Color(0xff7B6F72),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                        Container(
                          height: 45,
                          width: 130,
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: diet[index].viewIsSelected ? Colors.white : const Color(0xffC58BF2),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                diet[index].viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent,
                                diet[index].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent,
                              ]
                              ),
                           borderRadius: BorderRadius.circular(20),

                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 25,),
                itemCount: diet.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),)
            )

          ],
        );
  }

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Category',
                style: 
                TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
               height: 120,
               color: Colors.amber,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                separatorBuilder:(context, index) => const SizedBox(width: 25,),
                itemBuilder: (content, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color:  Colors.black,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        );
  }

  Container _searchField() {
    return Container(
          margin: const EdgeInsets.only(top: 40,left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0,
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              hintText: 'Search Pancake',
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 70, 70, 70),
                fontSize: 14,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 0.1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset('assets/icons/Filter.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Breakfast',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,

      ),),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap:() {
          
        } ,
        child: Container(
        alignment: Alignment.center,
        child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
        height: 20,
        width: 20,),
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10)
        ),
      ),
      ),
      actions: [
        GestureDetector(
        onTap: () {

        },
          child: Container(
          alignment: Alignment.center,
          width: 37,
          child: SvgPicture.asset('assets/icons/dots.svg',
          height: 5,
          width: 5,),
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10)
        ),
      ),
        )
       
      ],
    );
  }
}