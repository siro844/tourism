import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/cubit/app_cubits.dart';
import 'package:tourism/misc/colors.dart';
import 'package:tourism/widgets/app_largetext.dart';
import 'package:tourism/widgets/app_text.dart';
import 'package:tourism/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  List images=[
    "welcome_1.jpeg",
     "welcome_3.jpeg",
      "welcome_2.jpeg",
     
      
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_ , index){
          return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    // ignore: prefer_interpolation_to_compose_strings
                    "assets/images/"+images[index],
                  )
                  ),
              ),

              child: Container(
                margin: const EdgeInsets.only(top: 150,left: 20,right:20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: 'Trips'),
                        AppText(text: 'Mountain',size: 30,),
                        const SizedBox(height: 20,),
                        Container(
                          width: 250,
                          child: AppText(
                          text: 'Mountain hikes give you an incredible sense of freedom along with endurance',
                          color: AppColors.textColor2,
                          size: 14,
                          ),
                        ),
                        const SizedBox(height: 40,),
                        GestureDetector(
                          onTap: (){
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                            width: 200,
                            child: Row(children: [ResponsiveButton(width: 120,)])
                            ),
                        ),

                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index==indexDots?25:8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    )

                  ],
                ),
              ),
          );
        }),
    );
  }
}