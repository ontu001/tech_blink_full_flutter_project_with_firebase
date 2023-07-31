import 'package:flutter/cupertino.dart';
import 'package:tech_blink/const/app_colors.dart';
import 'package:tech_blink/model/products.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
     child: Padding(
       padding: EdgeInsets.only(left: 20,right: 20,top: 20),
       child: GridView.builder(
           itemCount: products.length,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             crossAxisSpacing: 10,
             mainAxisSpacing: 8,
             childAspectRatio: 0.85
           ),
           itemBuilder: (_,index){
              return Container(
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
                    Image.asset(products[index].image.toString(),height: 100),
                    Text(products[index].title.toString()),
                    Text('\$${products[index].price.toString()}',style: TextStyle(fontWeight: FontWeight.w600),),

                  ],
                ),
              );
           }
       ),
     ),
   );
  }


}