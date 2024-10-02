import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modal/news_modal.dart';
import 'package:url_launcher/url_launcher.dart';


class Newsdelails extends StatefulWidget {
  final New_model new_model ;
  const Newsdelails({super.key, required this.new_model });

  @override
  State<Newsdelails> createState() => _NewsdelailsState();
}

class _NewsdelailsState extends State<Newsdelails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( widget.new_model.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
              imageUrl:widget.new_model.urlToImage.toString(),
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: Colors.cyanAccent,
                  )),
              errorWidget: (context, url, error) => Icon(Icons.error),

            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.new_model.source!.name.toString(),
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
                  widget.new_model.publishedAt.toString(),
                  style: TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.new_model.author == null
                  ? " Name is hidden"
                  : "Author Name: " +  widget.new_model.author.toString(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " Title: " +widget.new_model.title.toString(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Description: " +widget.new_model.description.toString(),
              style: TextStyle(fontSize: 18),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 25,),
            ElevatedButton(onPressed: () async {
              final Uri url= Uri.parse(widget.new_model.url.toString());
              if( !await launchUrl(url)){
                throw Exception( " this link is demedge " );
              }

            }, child: Text( " Show Details"))
          ],
        ),
      ),
    );
  }
}
