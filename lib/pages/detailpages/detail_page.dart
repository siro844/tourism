import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/cubit/app_cubits.dart';
import 'package:tourism/cubit/app_cubitstates.dart';
import 'package:tourism/misc/colors.dart';
import 'package:tourism/pages/detailpages/cubit/store_pageinfo_cubit.dart';
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
    return BlocBuilder<AppCubits,CubitStates>(
     
      builder: (context,state){
         DetailState detail=state as DetailState;
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
                  decoration:BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detail.place.img),
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
                        onPressed: (){
                          BlocProvider.of<AppCubits>(context).goHome();
                        }, icon:Icon(Icons.arrow_back_ios),
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
                            AppLargeText(text: detail.place.name,color: Colors.black.withOpacity(0.8),),
                            AppLargeText(text:"\$"+detail.place.price.toString(),color: AppColors.mainColor),
                          ],
                        ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                            Icon(Icons.location_on,color: AppColors.mainColor,),
                            const SizedBox(width: 10,),
                            AppText(text: detail.place.location,color:AppColors.textColor1 ,)
                        ],
                      ),
                      const SizedBox(height: 20,),
                     Row(
                      children: [
                         Wrap(
                        children: List.generate(5, (index) {
                          return Icon(Icons.star,color:detail.place.stars>index?AppColors.starColor:AppColors.textColor2,);
                        }),
                         
                      ),
                        SizedBox(width: 10,),
                       AppText(text: '(5.0)',color: AppColors.textColor2,),
    
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
                                BlocProvider.of<StorePageInfoCubits>(context).addPageInfo(detail.place.name,index);
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
                      AppText(text: detail.place.description,
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
      },
    );
  }
}