import 'package:aj_news/BookMark/bookmark_details.dart';
//import 'package:aj_news/homeView_folder/homeView/homeView.dart';
import 'package:aj_news/homeView_folder/news_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookMark extends StatefulWidget {
  const BookMark({ Key? key }) : super(key: key);

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
 
 
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
                     const  SizedBox(width: 55,),
                        GestureDetector(onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => BookMark(),)); 
                        },
                          child: Container(
                                  child: Icon(Icons.bookmark,
                                  color: Colors.black,
                                  ),
                                ),
                        ),
                  ],
                )
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                            child: Column(
                              children: [
                               ...List.generate(BookMarkDetails.bookMarkList.length, (index) => Container(
                               margin: const EdgeInsets.symmetric(vertical: 8),
                               height: 120,
                               width: double.infinity,
                               child: InkWell(onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => NewsDetails(article: BookMarkDetails.bookMarkList[index]),
                                ),
                                );
                               },
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Column(
                                       children: [
                                         Container(
                                          width: MediaQuery.of(context).size.width/ 2,
                                           child: Text( BookMarkDetails.bookMarkList[index]['title'],
                                           style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                             fontSize: 20,
                                             fontWeight: FontWeight.bold,
                                             color: Colors.black
                                           ),
                                           maxLines: 3,
                                           ),
                                         ),
                                        const SizedBox(height: 30),
                                         Text(BookMarkDetails.bookMarkList[index]['published_date'],
                                         style: const TextStyle(
                                           fontSize: 15,
                                           fontWeight: FontWeight.normal,
                                           color: Colors.grey
                                         ),
                                         )
                                       ],
                                     ),
                                     Container(
                                       height: 120,
                                       width: 150,
                                       clipBehavior: Clip.hardEdge,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                       ),
                                       child: CachedNetworkImage(
                                        imageUrl: BookMarkDetails.bookMarkList[index]['media'],
                                       fit: BoxFit.cover,
                                       ),
                                       )
                                   ],
                                 ),
                               )
                             
                               ),
                             )
                      
                              ],
                            ),
                          ),
                  ],
                ),
              )
            ],
         ),
      ),
      ),
      );
  }
}
setSavedBookMark() async{


}

getSaveBookMark()async{
  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool alreadySaved = preferences.getBool('already saved')?? false; //if bookmark hasn't been saved before the shared preference will return null 

}