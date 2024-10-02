import 'package:flutter/material.dart';
import 'package:newsapp/Components/newsItemLIst.dart';
import 'package:newsapp/modal/news_modal.dart';
import 'package:newsapp/services/api_services.dart';

class BrackingNews extends StatefulWidget {
  const BrackingNews({super.key});

  @override
  State<BrackingNews> createState() => _BrackingNewsState();
}

class _BrackingNewsState extends State<BrackingNews> {

  ApiServices apiServices= ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(.2),
      body:  FutureBuilder(future: apiServices.getbrakingNews(), builder: (context, snapshot) {
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
