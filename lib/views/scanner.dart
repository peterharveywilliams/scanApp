import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scanapp/models/variables_define/colors.dart';
import 'package:scanapp/view_models/providers/home.dart';
import 'package:scanapp/view_models/providers/scanner.dart';


class Scanner extends StatelessWidget {

  TextEditingController addCodeBar = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


    return Consumer<ScannerProvider>(
        builder: (context, value, child) {
         return Scaffold(
           key: scaffoldKey,

           resizeToAvoidBottomInset: false,
           backgroundColor: ColorsOf().backGround(),
           appBar: AppBar(
             backwardsCompatibility: false,
             systemOverlayStyle: SystemUiOverlayStyle(
               statusBarColor: Colors.transparent,
               statusBarIconBrightness:Theme.of(context).primaryColorBrightness,
             ),

             brightness: Theme.of(context).primaryColorBrightness,

             backgroundColor: ColorsOf().backGround(),
             leading: IconButton(
               onPressed: () => scaffoldKey.currentState!.openDrawer(),
               icon: Icon(Icons.menu , color: ColorsOf().primaryBackGround(),),
             ),
             elevation: 0,
             actions: [
               Container(
                 color:Colors.transparent,
                 alignment: Alignment.centerRight,
                 padding: EdgeInsets.only(right: 10),
                 child: MaterialButton(
                   color:ColorsOf().primaryBackGround() ,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(100),
                   ),
                   padding: EdgeInsets.all(0),

                   minWidth: 150,
                   height: 50,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Icon(Icons.camera_alt_rounded,color: ColorsOf().containerThings()),
                       SizedBox(width: 10,),
                       Text("Camera" ,style: TextStyle(color: ColorsOf().containerThings(),fontSize: 20),),
                     ],
                   ),
                   onPressed: (){

                   },
                 ),
               )
             ],
           ),
           drawer: HomeProvider().drawerApp(context),
           floatingActionButton: FloatingActionButton.extended(

             icon: Icon(Icons.check,color: ColorsOf().primaryBackGround() ),
             label: Text("Valider" ,style: TextStyle(fontSize: 20 , fontWeight:FontWeight.bold,color:ColorsOf().primaryBackGround()),),
             backgroundColor: ColorsOf().containerThings(),
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(100),
                 side:BorderSide(color: ColorsOf().containerThings(),width: 1,style:BorderStyle.solid)),

             onPressed: () {},
           ),


           body: Container(
             height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
             alignment: Alignment.bottomCenter,

             child: Stack(
               alignment: Alignment.topCenter,
               children: [

                 Container(
                   height: MediaQuery.of(context).size.height * 0.9 ,
                   width: MediaQuery.of(context).size.width ,
                   padding: EdgeInsets.only(top: 50),


                   child: Container(
                       padding: EdgeInsets.only(top: 50),
                       decoration: BoxDecoration(
                         color: ColorsOf().primaryBackGround(),
                         borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                       ),
                       child: Form(
                         key: value.formKey,
                         child: SingleChildScrollView(
                           padding: EdgeInsets.all(10),
                           child: Column(

                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Container(
                                 height: 50,
                                 width: MediaQuery.of(context).size.width,
                                 alignment: Alignment.center,
                                 margin: EdgeInsets.only(bottom: 10),
                                /*
                                * Trouver :
                                * backgroung =>ColorsOf().finisheItem(),
                                * foreground ==> ColorsOf().borderContainer()
                                * non-Trouver :
                                * background ==>ColorsOf().deleteItem(),
                                * foreground ==>ColorsOf().backGround()
                                * */
                                   decoration: BoxDecoration(
                                     color: ColorsOf().finisheItem(),
                                     borderRadius: BorderRadius.all(Radius.circular(10)),
                                   ),
                                 child: Text("Trouver le code à barre", style: TextStyle(color: ColorsOf().borderContainer(),fontSize: 20,fontWeight: FontWeight.bold),)
                               ),
                               value.inputBarCode(),
                               SizedBox(height: 10),
                               Container(
                                 width: MediaQuery.of(context).size.width,
                                 decoration: BoxDecoration(
                                   color: ColorsOf().containerThings(),
                                   borderRadius: BorderRadius.all(Radius.circular(10)),
                                 ),
                                 child: Column(
                                   children: [
                                     ListTile(
                                       shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.all(Radius.circular(10)),
                                           side: BorderSide(color:Colors.transparent ,width: 0,style: BorderStyle.solid)
                                       ),
                                       title: RichText(
                                           text: TextSpan(children: [

                                             TextSpan(text:"ID Emplacement : ",
                                               style: TextStyle(color : ColorsOf().primaryBackGround() ,fontSize: 14 ,fontWeight: FontWeight.bold),
                                             ),
                                             TextSpan(text:"100000",
                                               style: TextStyle(color : ColorsOf().primaryBackGround() ,fontSize: 14 ,fontWeight: FontWeight.bold),
                                             ),

                                           ])
                                       ),

                                       tileColor:ColorsOf().primaryBackGround(),
                                       onTap:null,
                                     ),
                                     ListTile(
                                       shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.all(Radius.circular(10)),
                                           side: BorderSide(color:Colors.transparent ,width: 0,style: BorderStyle.solid)
                                       ),
                                       title: RichText(
                                           text: TextSpan(children: [

                                             TextSpan(text:"Nom Emplacement : ",
                                               style: TextStyle(color : ColorsOf().primaryBackGround() ,fontSize: 14 ,fontWeight: FontWeight.bold),
                                             ),
                                             TextSpan(text:"100000",
                                               style: TextStyle(color : ColorsOf().primaryBackGround() ,fontSize: 14 ,fontWeight: FontWeight.bold),
                                             ),

                                           ])
                                       ),

                                       tileColor:ColorsOf().primaryBackGround(),
                                       onTap:null,
                                     ),
                                   ],
                                 ),
                               ),
                               SizedBox(height: 20),
                               Container(
                                 width: MediaQuery.of(context).size.width,
                                 decoration: BoxDecoration(
                                   color: ColorsOf().containerThings(),
                                   borderRadius: BorderRadius.all(Radius.circular(10)),
                                 ),
                                 child: Column(
                                   children: [
                                     Container(

                                       child: ListTile(
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.all(Radius.circular(10)),
                                             side: BorderSide(color:Colors.transparent ,width: 0,style: BorderStyle.solid)
                                         ),

                                         title: RichText(
                                             text: TextSpan(children: [

                                               TextSpan(text:"Code à Barre : ",
                                                 style: TextStyle(color : ColorsOf().primaryBackGround() ,fontSize: 14 ,fontWeight: FontWeight.bold),
                                               ),
                                               TextSpan(text:"100000",
                                                 style: TextStyle(color : ColorsOf().primaryBackGround() ,fontSize: 14 ,fontWeight: FontWeight.bold),
                                               ),

                                             ])
                                         ),

                                         tileColor:ColorsOf().primaryBackGround(),
                                         onTap:null,
                                       ),
                                     ),
                                     Container(
                                       child: ListTile(
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.all(Radius.circular(10)),
                                             side: BorderSide(color:Colors.transparent ,width: 0,style: BorderStyle.solid)
                                         ),
                                         title: RichText(
                                             text: TextSpan(children: [

                                               TextSpan(text:"ID Produit : ",
                                                 style: TextStyle(color : ColorsOf().primaryBackGround() ,fontSize: 14 ,fontWeight: FontWeight.bold),
                                               ),
                                               TextSpan(text:"100000",
                                                 style: TextStyle(color : ColorsOf().primaryBackGround() ,fontSize: 14 ,fontWeight: FontWeight.bold),
                                               ),

                                             ])
                                         ),

                                         tileColor:ColorsOf().primaryBackGround(),
                                         onTap:null,
                                       ),
                                     ),
                                     Container(
                                        alignment: Alignment.centerLeft,
                                       padding: EdgeInsets.only(left: 20),
                                       child:Text("Etat : ",
                                         style: TextStyle(color : ColorsOf().primaryBackGround() ,fontSize: 14 ,fontWeight: FontWeight.bold),
                                       ),

                                     ),

                                     value.inputState(),

                                   ],
                                 ),
                               ),


                             ],
                           ),
                         ),
                       )

                   ),

                 ),
                 value.logoWidget(),
               ],
             ),
           ),
         );


        });

  }
}
