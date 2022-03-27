
import 'package:flutter/material.dart';
import 'package:flutter_app2/Presentation/Modules/introductionScreen.dart';
import 'package:flutter_app2/Presentation/Modules/signInscreen.dart';
import 'package:flutter_app2/Presentation/Modules/splash.dart';
import 'package:flutter_app2/constants/screens.dart';

import 'data/local/cacheHelper.dart';

class AppRoute

{

  Route? onGenerateRoute(RouteSettings routeSettings)
  {
switch(routeSettings.name)
{
  case '/':


      return MaterialPageRoute(builder: (_)
      {
        bool onBoard=CacheHelper.getKey('onBoarding');
      if(onBoard)
        {
         return SplashScreen(nextScreen: SignInScreen(),);
        }
      else
        {
          return SplashScreen(nextScreen: IntroductionScreen(),);
        }
      }
      );

  case introPath:
    return MaterialPageRoute(builder: (_)=>IntroductionScreen());
  case signInPath:
    return MaterialPageRoute(builder: (_)=>SignInScreen());
}
  }
}
