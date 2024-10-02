import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/screen/BrackingNews.dart';
import 'package:newsapp/screen/All_news.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("News App",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w700),),
            centerTitle: true,
            backgroundColor: Colors.cyan,
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                // borderRadius: const BorderRadius.all(Radius.circular(25)),
                color: Colors.cyanAccent.withOpacity(0.6),
              ),
              unselectedLabelColor: Colors.white.withOpacity(.8),
              labelColor: Colors.white,
              tabs: const [
                Tab(
                  icon: Icon(Icons.book),
                  text: "Bracking News",
                ),
                Tab(icon: Icon(Icons.book_outlined), text: "All News"),
              ],
            ),
          ),
          body: const TabBarView(
            children: [ BrackingNews(),All_news()],
          ),
        ));
  }
}
