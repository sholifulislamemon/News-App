import 'package:flutter/material.dart';

import '../Components/newsItemLIst.dart';
import '../modal/news_modal.dart';
import '../services/api_services.dart';

class All_news extends StatefulWidget {
  const All_news({super.key});

  @override
  State<All_news> createState() => _All_newsState();
}

class _All_newsState extends State<All_news> {
  ApiServices apiServices= ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(.2),
      body:  FutureBuilder(future: apiServices.getAllNews(), builder: (context, snapshot) {
        if(snapshot.hasData){
          List<New_model>articalList= snapshot.data ?? [];
          return ListView.builder(
            itemCount: articalList.length,
            itemBuilder: (context, index) {
              return Newsitemlist(new_model: articalList[index]);


            },);
        }else{
          return Center( child: CircularProgressIndicator( color: Colors.cyanAccent,strokeAlign: 3,strokeWidth: 5,),);
        }
      },),

    );
  }
}
