import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Reading extends StatefulWidget {
  Reading({ Key? key, required this.articleLink }) : super(key: key);

  String articleLink;

  @override
  State<Reading> createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
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
                    offset: const Offset (0, 3)
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

                //webview has a minimumgradle version accepted/
                //to edit it, go to android/app/bildgradle, change minSdk version to 21
                // then save
                Expanded(
                  child: WebView(
                    initialUrl: widget.articleLink,
                    javascriptMode: JavascriptMode.unrestricted ,

                  ),
                )


              ],
          ),
        ),
        ),
    );
  }
}