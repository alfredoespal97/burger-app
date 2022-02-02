import 'package:flutter/material.dart';

import '../constants.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Información', style: TextStyle(color: Colors.white),),
        elevation: 0,
        backgroundColor: kPrimaryColor,

      ),
      body:Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      blurRadius: 20,
                      spreadRadius: 10,

                    )
                  ],
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),

                  )

              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 105,
                          width: 105,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(52.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius:2,
                                )
                              ]

                          ),

                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/images/icon.png'),
                          ),
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('versión 1.0.0', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                  Padding(
                    padding: const EdgeInsets.only( bottom: 35),
                    child: Text('Burger Shop', style: TextStyle(color: Colors.white,fontSize: 23, fontWeight: FontWeight.bold  ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(onPressed: (){
                              //FlutterPhoneDirectCaller.callNumber('+5354918583');
                            }, icon: Icon(Icons.call,color:Colors.white70)),
                            const SizedBox(width: 10,),
                            Column(children:const <Widget>[
                              Text("Alfredo R Espinosa",style: TextStyle(fontSize:18,color:Colors.white70,fontWeight: FontWeight.bold),),
                              Text("+5354918583",style: TextStyle(fontSize:12,color:Colors.white70,fontWeight: FontWeight.bold))
                            ] ),
                          ],
                        ),
                      ]

                    ),
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
