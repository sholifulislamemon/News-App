import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modal/news_modal.dart';
import 'package:newsapp/screen/NewsDelails.dart';

class Newsitemlist extends StatelessWidget {
  final New_model new_model;
  Newsitemlist({super.key, required this.new_model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Newsdelails(new_model: new_model);
        },));
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                  imageUrl: new_model.urlToImage.toString(),
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: Colors.cyanAccent,
                  )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        new_model.source!.name.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    new_model.publishedAt.toString(),
                    style: TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                new_model.author == null
                    ? " Name is hidden"
                    : "Author Name: " + new_model.author.toString(),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                new_model.title.toString(),
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
