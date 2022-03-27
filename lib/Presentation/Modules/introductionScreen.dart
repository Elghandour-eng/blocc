
import 'package:flutter/material.dart';
import 'package:flutter_app2/constants/imagesPathes.dart';
import 'package:flutter_app2/constants/screens.dart';
import 'package:flutter_app2/data/local/cacheHelper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:dio/dio.dart';
class IntroductionScreen extends StatelessWidget {

   IntroductionScreen({Key? key}) : super(key: key);
   var controller = PageController(viewportFraction: 1, keepPage: false);
 List  pages = List.generate(
      3,
          (index) => Column(
            children: [
              Container(
        decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
        ),
        margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: SizedBox(
              height:SizerUtil.orientation==Orientation.landscape?25.w :35.h,
              child: Center(
                  child:Image.asset(introImage)),
        ),
      ),
              SizedBox(height:  2.5.h,),

           const   Text('Welcome Back !'),
              SizedBox(height: 5.h,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Stay signed in with your account to make searching easier',style: TextStyle
                  (
fontWeight: FontWeight.w500,fontSize: 10.sp
                ),),
              ),

            ],
          ));

late Dio dio ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: ()
                      {
                        controller.jumpToPage(2);
                    
                      },
                      child: Text('Skip',style: TextStyle(fontSize: 10.5.sp),)),
                  Text('عربي',style: TextStyle(fontSize: 15.sp,color: Colors.green),)
                ],
              ),
            ),
            SizedBox(
              height: SizerUtil.orientation==Orientation.landscape?60.w :60.h,
              child: PageView.builder(
                controller: controller,
                // itemCount: pages.length,
                itemBuilder: (_, index) {
                  return pages[index % pages.length];
                },
              ),
            ),
            Container(
              child: SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 7.5,
                  dotWidth: 10,
activeDotColor: Colors.green.shade300,
                  dotColor: Colors.grey[300]!

                ),
              ),
            ),
            SizedBox(height: 1.h,),
            InkWell(

              onTap: ()
              {
                CacheHelper.putBool('onBoarding', true);
                Navigator.pushNamed(context, signInPath);
              },
              child: Container(
decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
  color: Colors.green,
),
                height: 35,
                width: 35,
                child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(arrowIcon,color: Colors.white,),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
