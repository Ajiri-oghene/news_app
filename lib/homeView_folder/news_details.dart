
import 'package:aj_news/BookMark/bookmark_details.dart';
import 'package:aj_news/homeView_folder/reading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// stateless/stateful widget is used when there is a view
class NewsDetails extends StatelessWidget {
  NewsDetails({ Key? key, required this.article }) : super(key: key);

  Map<String, dynamic> article;

//Map< String, dynamic> article = {}; this is used to pass a string
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: double.infinity,
                 margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                  offset: const Offset (0, 3),
                    )
                  ]
                ),
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon:const Icon(Icons.arrow_back)),
                    const Text('Bulletin News',
                    style: TextStyle(
                      color: Colors.black,
                       fontSize: 39,
                       fontWeight: FontWeight.bold,

                    ),
                    ),
                  ],
                )
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  children: [
                  Stack(
                   children:[
                   Container(
                  height: 250,
                  width: double.infinity,
                  child: CachedNetworkImage(
                  imageUrl: article ['media'],
                  fit: BoxFit.cover,
                  ),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                    clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                         color: Colors.black.withOpacity(0.1),
                          ),
                             height: 250,
                             width: double.infinity,                                     
                           ),
                           Positioned(
                            top: 10,
                            right: 0,
                            child: GestureDetector(onTap: () {
                              //supposing bookmark button was put in homeview page, 
                              //then we would have written 
                              //BookMarkDetails.bookMarkList.add(articleList[index])
                              BookMarkDetails.bookMarkList.add(
                                article
                              );
                              print('THIS IS $article');
                       
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('bookmarked')));
                            },
                              child: Container(
                                child: Icon(Icons.bookmark,
                                color: Colors.white,
                                ),
                              ),
                            ),
                            ),
                         ], 
                       ),
                const SizedBox(height: 20,),
                 Text(article['summary'],
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ), 
                const SizedBox(height: 60),

                Center(
                      child: ElevatedButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Reading(articleLink: article['link'],)));
                      },
                       child: const Text(
                        'Read',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                       ),
                       style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        primary: Colors.amber,
                       ),
                       ),
                    ),
                    const SizedBox(height: 20),
                     
                  ],
                ),
              ),
            
                  ],
                ),
              ),
          ),
        );
  }
}