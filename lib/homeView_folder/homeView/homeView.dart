//import 'dart:developer';

import 'package:aj_news/BookMark/bookMark.dart';
import 'package:aj_news/homeView_folder/news_details.dart';
import 'package:aj_news/services/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';



class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}
  int selectedIndex = 0;

  // instance of a class is used to access 
  //the properties of a class
  NewsServices _newsServices = NewsServices();

// = means to initialize
  List<Map<String, dynamic>> articleList = [];

class _HomeViewState extends State<HomeView> {
  @override
  //initstate is the first function that
  // is called before the app builds

  void initState() {
    //call the function getNews
   getArticle();
    // getArticle is a function
    super.initState();
    setState(() {
      
    });
  }

  getArticle () async{
   articleList = await _newsServices.getNews();
   //articleList is a variable that holds our news data
setState(() {
  
});

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: articleList.isEmpty? CircularProgressIndicator() : // if articleList
        // is empty use circular progress idicator
         Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Container(
            padding: const EdgeInsets.all(12),
            height: 70,
            width: double.infinity,
            decoration:  BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset (0, 3),
                  // spreadRadius: 0,
                  blurRadius: 5
                ),
              ],
            ),
             child: Row(
               children:[ const Text(
                          'Bulletin News',
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
                        ] 
             ),
                      margin: const EdgeInsets.only(bottom: 15),
           ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomScrollView(
                  
                  slivers: [
                    const SliverToBoxAdapter(child: SizedBox(height: 6,)),
                     const SliverToBoxAdapter(
                       child: Text(
                         'Saturday, August 21th',
                         style: TextStyle(
                           color: Colors.grey,
                           fontSize: 26,
                           fontWeight: FontWeight.normal,
                         ),
                       ),
                     ),
                     const SliverToBoxAdapter(child: SizedBox(height: 30,)),
                     SliverPinnedHeader(
                       child: Container(
                        padding: const EdgeInsets.only(bottom: 12),
                        color: Colors.white,
                         child: Container(
                           height: 40,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(40),
                             color: Colors.grey.withOpacity(0.2),
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           
                             children: [
                               ...List.generate(3, (index) => GestureDetector( onTap: () {
                                 selectedIndex = index;
                                 setState(() {});
                               },
                                 child: Container(
                                   margin: const EdgeInsets.all(5),
                                   padding: const EdgeInsets.symmetric(horizontal: 15),
                                   height: 32,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(40),
                                     color: selectedIndex == index? Colors.white: Colors.transparent
                                   ),
                                   
                                   child: const Center(
                                     child: Text(
                                       'feeds',
                                       style: TextStyle(
                                         fontSize: 15,
                                         fontWeight: FontWeight.bold,
                                         color: Colors.black, 
                                       ),
                                       ),
                                   ),
                                 ),
                               ),
                                 )
                             ],

                           ),
                         ),
                       ),
                     ),
                     const SliverToBoxAdapter(child:  SizedBox(height: 30,)),
                     SliverToBoxAdapter(
                       child: SingleChildScrollView(
                         scrollDirection: Axis.horizontal,
                         child: Row(
                           
                           children: [
                              ...List.generate(8, (index) => GestureDetector(onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>  NewsDetails(article:articleList [index],),));
                              },
                                child: Stack(
                                    children: [
                                      Container(
                                       margin: const EdgeInsets.symmetric(horizontal: 10),
                                       clipBehavior: Clip.hardEdge,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10)
                                       ),
                                       height: 200,
                                       width: 180,
                                       child: CachedNetworkImage(
                                        imageUrl:articleList[index]['media'], 
                                       fit: BoxFit.cover,),
                                     ),
                                     Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black.withOpacity(0.2),
                                      ),
                                      height: 200,
                                      width: 180,                                     
                                     ),
                                     Positioned(
                                      left: 8,
                                      bottom: 8,
                                      top: 18,
                                       child: Container(
                                        width: 180,
                                        padding: const EdgeInsets.all(10),
                                        child: 
                                       Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                           Text(articleList[index]['title'],
                                          style:  const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis
                                          ),
                                          maxLines: 2,
                                          ),
                                          const SizedBox(height: 12,),
                                          // for date formatting install intl package
                                          Text(articleList[index]['published_date'],
                                          style: const TextStyle(
                                           color: Colors.white,
                                           fontWeight: FontWeight.normal,
                                           fontSize: 15
                                          ),
                                          ),
                                        ],
                                      ),
                                       ),
                                     )

                                    ],
                                  ),
                              ),
                                )
                           ],
                         ),
                       ),
                     ),
                     const SliverToBoxAdapter(child:  SizedBox(height: 30,)),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                         ...List.generate(15, (index) => Container(
                         margin: const EdgeInsets.symmetric(vertical: 8),
                         height: 120,
                         width: double.infinity,
                         child: InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => NewsDetails(article: articleList[index]),
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
                                     child: Text( articleList[index]['title'],
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
                                   Text(articleList[index]['published_date'],
                                   style: TextStyle(
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
                                  imageUrl: articleList[index]['media'],
                                 fit: BoxFit.cover,
                                 ),
                                 )
                             ],),
                         )
                       
                         ),
                       )
                
                        ],
                      ),
                    )
                   ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}