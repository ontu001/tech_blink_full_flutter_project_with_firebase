import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blink/const/app_colors.dart';
import '../../../services/firesotre_db.dart';








class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
     child: Padding(
       padding: EdgeInsets.only(left: 20,right: 20,top: 20),
       child: FutureBuilder(
         future: FirestoreDB().getProducts(),
         builder: (_, snapshot){
           if(snapshot.connectionState==ConnectionState.done){
             if (snapshot.hasData){
               return GridView.builder(
                   itemCount: snapshot.data!.length,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       crossAxisSpacing: 10,
                       mainAxisSpacing: 10,
                       childAspectRatio: 0.85
                   ),
                   itemBuilder: (_,index){
                     return InkWell(
                       child: Ink(
                         padding: EdgeInsets.all(15),
                         decoration: BoxDecoration(
                             color: AppColors.whiteColor,
                             borderRadius: BorderRadius.circular(10),
                             boxShadow: [
                               BoxShadow(
                                   color: AppColors.grayColor.withOpacity(0.5),
                                   spreadRadius: 2,
                                   blurRadius: 3,
                                   offset: Offset(0,3)
                               ),
                             ]
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             CachedNetworkImage(
                               imageUrl: snapshot.data![index].thumbnail,
                               height: 100,
                               fit: BoxFit.cover,
                               progressIndicatorBuilder: (context, url, progress)=> Center(child: CircularProgressIndicator(value: progress.progress,),),
                               errorWidget: (context, url, error)=> Icon(Icons.error),
                             ),

                             Text(
                               snapshot.data![index].title,
                               textAlign: TextAlign.center,
                               style: TextStyle(fontSize: 13),
                             ),
                             Text('\$${snapshot.data![index].price.toString()}',style: TextStyle(fontWeight: FontWeight.w600),),

                           ],
                         ),
                       ),
                     );
                   }
               );
             }
             else{
               return Center(child: Text('Someting went wrong'),);
             }
           }
           else{
             return Center(child: CircularProgressIndicator(),);
           }
         },
       ),
     ),
   );
  }


}