import 'package:flutter/material.dart';

class BuildArticleWidget extends StatelessWidget {
   BuildArticleWidget({
    super.key, required this.imageUrl, required this.title, required this.pubDate,
    
  });
final String imageUrl;
final String title;
final String pubDate;


  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
           Container(
            width: 120,
            height: 120,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image:NetworkImage(imageUrl) ,fit: BoxFit.cover)
            )
           ),
           const SizedBox(width: 20,),
            Expanded(
              child: Container(
                height: 120,
                child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(title,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        fontSize: 20,
                                    
                      ),),
                    ),
                   Text(pubDate,style:const TextStyle(
                    color:Colors.grey
                    ),),
                  
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
