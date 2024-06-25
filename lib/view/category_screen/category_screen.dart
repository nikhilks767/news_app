// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/controller/category_screen_controller.dart';
import 'package:news_app/utils/text_style.dart';
import 'package:news_app/view/widgets/category_detail.dart';
import 'package:provider/provider.dart';

class CategorySCreen extends StatelessWidget {
  const CategorySCreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryScreenController provider =
        Provider.of<CategoryScreenController>(context);
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: provider.categoryList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              provider.onTap(index: index);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryDetail(),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(provider.imageList[index]),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Text(provider.categoryList[index].toUpperCase(),
                      style: NewsText.categoryText)),
            ),
          ),
        ),
      ),
    );
  }
}
