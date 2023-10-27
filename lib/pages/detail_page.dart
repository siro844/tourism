import 'package:flutter/material.dart';
import 'package:tourism/misc/colors.dart';
import 'package:tourism/widgets/appButtons.dart';
import 'package:tourism/widgets/app_largetext.dart';
import 'package:tourism/widgets/app_text.dart';
import 'package:tourism/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars=4;
  int selectedindex=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child:  Stack(
           children: [

            Positioned(
              left: 0,
              right: 0,
              child: 
            Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/mountain_1.jpeg"),
                    fit: BoxFit.cover
                  ),

                ),
            )
            ),
             Positioned(
              left: 15,
              top: 50,
              child: Row(
                children: [
                    IconButton(
                      onPressed: (){}, icon:Icon(Icons.menu),
                      color: Colors.white,
                      )
                ],
              ),
              ),
            Positioned(
              top: 320,
              child:  Container(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 700,
                  decoration: const BoxDecoration(
                     color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: 'Yosemite',color: Colors.black.withOpacity(0.8),),
                          AppLargeText(text: '\$ 250',color: AppColors.mainColor),
                        ],
                      ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                          Icon(Icons.location_on,color: AppColors.mainColor,),
                          const SizedBox(width: 10,),
                          AppText(text: "USA,California",color:AppColors.textColor1 ,)
                      ],
                    ),
                    const SizedBox(height: 20,),
                   Row(
                    children: [
                       Wrap(
                      children: List.generate(5, (index) {
                        return Icon(Icons.star,color:gottenStars>index?AppColors.starColor:AppColors.textColor2,);
                      }),
                       
                    ),
                      SizedBox(width: 10,),
                     AppText(text: '(4.0)',color: AppColors.textColor2,),

                    ],
                   ),
                    const SizedBox(height: 25,),
                    AppLargeText(text: 'People',color: Colors.black.withOpacity(0.8),size: 20,),
                    const SizedBox(height: 5,),
                    AppText(text: 'Number of People in your group',color: AppColors.mainTextColor,),
                   const SizedBox(height: 10,),
                    Wrap(
                      children: 
                        List.generate(5, (index) {
                          return InkWell(
                            onTap: (){
                              setState(() {
                                 selectedindex=index;
                              });
                               
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10,),
                              child: AppButton(
                                color:selectedindex==index?Colors.white :Colors.black,
                               bgColor: selectedindex==index?Colors.black :AppColors.buttonBackground,
                                borderColor: selectedindex==index?Colors.black:AppColors.buttonBackground,
                                 size: 50,
                                text: (index+1).toString(),
                                 ),
                            ),
                          );
                        }),
                      
                    ),
                    SizedBox(height: 20,),
                    AppLargeText(text: "Description",color: Colors.black.withOpacity(0.8),),
                    SizedBox(height: 20,),
                    AppText(text: "You must go for a travel.Travelling helps u get rid of pressure.Go to the mountains and see the nature.",
                    color: AppColors.mainTextColor,
                   
                    ),

                    ],
                  ),
              ),
              ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                  children: [
                    AppButton(color: AppColors.textColor1,
                     bgColor: Colors.white, 
                     borderColor: AppColors.textColor1,
                      size: 60,
                      isIcon: true,
                      icon: Icons.favorite_border,
                      ),
                   SizedBox(width: 20,),
                    ResponsiveButton(
                      isResponsive: true,
                    ),
                  ],
              )
              ),
           ],
      ),
      )
      
    );
  }
}