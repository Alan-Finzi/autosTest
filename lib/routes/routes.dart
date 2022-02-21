import 'package:auto_test_app/pages/detail_car_page.dart';
import 'package:auto_test_app/pages/detail_service_page.dart';
import 'package:auto_test_app/pages/history_services_page.dart';
import 'package:auto_test_app/pages/home_page.dart';
import 'package:auto_test_app/pages/load_car_page.dart';
import 'package:auto_test_app/pages/load_page.dart';
import 'package:auto_test_app/pages/search_page.dart';
import 'package:auto_test_app/pages/services_page.dart';
import 'package:auto_test_app/pages/start_page.dart';
import 'package:flutter/material.dart';


class ApplicationRoutes {
    static Map<String, WidgetBuilder> getApplicationRoutes(){
        return <String, WidgetBuilder> {
            //#application
            StartPage.routeName               : (BuildContext context) => const StartPage(),
            HomePage.routeName                : (BuildContext context) => const HomePage(),
            SearchPage.routeName              : (BuildContext context) => const SearchPage(),
            LoadPage.routeName                : (BuildContext context) => const LoadPage(),
            DetailCarPage.routeName           : (BuildContext context) =>  const DetailCarPage(),
            ServicesPage.routeName            : (BuildContext context) =>  const ServicesPage(),
            LoadCarPage.routeName             : (BuildContext context) =>   const LoadCarPage(),
            HistoryServicesPage.routeName     : (BuildContext context) =>   const HistoryServicesPage(),
            DetailServicePage.routeName       : (BuildContext context) =>   const DetailServicePage(),
        };
    }
}


//////////////////////////////////////
//////////////////////////////////////
///  MUST BE IMPLEMENT NEXT CLASS  ///
//////////////////////////////////////
class AppRoutes{
    static void autosNavigator({required BuildContext context, required String routeName}){
        Navigator.of(context).push(_createRoute(destinationPage: _navigationData[routeName]),);
    }

    static Route _createRoute({dynamic destinationPage}) {
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => destinationPage,
            transitionsBuilder: (context, animation, secondaryAnimation, child) { return child;},
        );
    }

    static final Map<String, dynamic> _navigationData = {
        StartPage.routeName                  : const StartPage(),
        HomePage.routeName                   : const HomePage(),
        SearchPage.routeName                 : const SearchPage(),
        LoadPage.routeName                   : const LoadPage(),
        DetailCarPage.routeName              : const DetailCarPage(),
        ServicesPage.routeName               : const ServicesPage(),
        LoadCarPage.routeName                :  const LoadCarPage(),
        HistoryServicesPage.routeName        :  const HistoryServicesPage(),
        DetailServicePage.routeName          :  const DetailServicePage(),
    };
}