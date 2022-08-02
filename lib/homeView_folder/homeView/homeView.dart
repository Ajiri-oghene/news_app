import 'package:aj_news/homeView_folder/news_details.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

void main () => runApp(const HomeView());

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}
  int selectedIndex = 0;


class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
             child: const Text(
                        'Bulletin News',
                         style: TextStyle(
                          color: Colors.black,
                          fontSize: 39,
                          fontWeight: FontWeight.bold,
                         ),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetails(),));
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
                                       child: Image.network('https://cdn.punchng.com/wp-content/uploads/2021/02/01101831/a3.jpg', 
                                       fit: BoxFit.cover,),
                                 ),
                                 
                                
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
                         ...List.generate(15, (index) => GestureDetector( onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const NewsDetails())
                          );
                         },
                           child: Container(
                           margin: const EdgeInsets.symmetric(vertical: 8),
                           height: 120,
                           width: double.infinity,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                                 children: const [
                                   Text('Headline',
                                   style: TextStyle(
                                     fontSize: 13,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black
                                   ),
                                   ),
                                   SizedBox(height: 30),
                                   Text('time',
                                   style: TextStyle(
                                     fontSize: 12,
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
                                 child: Image.network('https://cdn.punchng.com/wp-content/uploads/2021/02/01101831/a3.jpg',
                                 fit: BoxFit.fill,
                                 ),
                                 )
                             ],)
                       
                           ),
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