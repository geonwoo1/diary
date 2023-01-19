import 'package:diary/view/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controller/mapController.dart';
import 'drawer.dart';


class profile extends StatelessWidget {
  final ScrollController scr = ScrollController();
  final mapCon = Get.put(mapController());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: baseAppbar(),
      drawer: drawerPage(),
      body: SingleChildScrollView( //바디부분 전체 스크롤 감싸기
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                  size.height * 0.05, size.height * 0.05, size.height * 0.05,
                  0),
              width: size.width * 0.9,
              height: size.height * 0.2,
              child: Row(
                children: [Container(
                  width: size.width * 0.23,
                  height: size.height * 0.23,
                  child: const CircleAvatar(backgroundImage:
                  AssetImage('image/profile.jpg'), // 이미지 불러오기
                    radius: 60.0,),
                ), Container(
                  width: size.width * 0.2,
                  height: size.height * 0.15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 15),
                      child: Text("이건우", style: TextStyle(fontSize: 25),),
                    ), Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text("대한민국", style: TextStyle(fontSize: 13),),
                    ), Container(
                      child: Text("ko", style: TextStyle(fontSize: 13),),
                    ),
                    ],
                  ),
                ), Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                 // width: size.width * 0.3,
                  height: size.height * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ Container(
                      width: size.width*0.15,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                          backgroundColor: Colors.lightGreen,
                        ),
                        onPressed: () {},
                        child: const Text(
                          '채팅',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),), Container(
                      width: size.width*0.15,
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                          backgroundColor: Colors.lightGreen,
                        ),
                        onPressed: () {},
                        child: const Text(
                          '친구',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),),
                    ],
                  ),
                )
                ],
              ),
            ), Container(
                margin: EdgeInsets.fromLTRB(
                    size.height * 0.05, 0, size.height * 0.05,
                    size.height * 0.02),
                padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
                width: size.width * 0.9,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Container(
                      child: Column(
                        children: [Container(
                          child: Text("친구들", style: TextStyle(
                            color: Colors.lightBlueAccent, fontSize: 20,),),
                        ), Container(
                          child: Text("80만"),
                        )
                        ],
                      )
                  ), Container(
                      child: Column(
                        children: [Container(
                          child: Text("래빗 글", style: TextStyle(
                            color: Colors.lightBlueAccent, fontSize: 18,),),
                        ), Container(
                          child: Text("0"),
                        )
                        ],
                      )
                  ), Container(
                      child: Column(
                        children: [Container(
                          child: Text("엘리스 글", style: TextStyle(
                            color: Colors.lightBlueAccent, fontSize: 18,),),
                        ), Container(
                          child: Text("40"),
                        )
                        ],
                      )
                  )
                  ],

                )
            ), Container(
              margin: EdgeInsets.fromLTRB(
                  size.height * 0.05, 0, size.height * 0.05,
                  size.height * 0.02),
              width: size.width * 0.9,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,),
                borderRadius: BorderRadius.circular(30),
              ),
            ), Container(
              color: Colors.white38,
              width: size.width * 0.9,
              child: Column(
                children: [Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.02),
                  child: Text("활동장소"),
                ), Container(
                  color: Colors.green,
                  height: size.height * 0.4,
                  child:
                  GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: Get.find<mapController>().kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      Get.find<mapController>().controller1.complete(controller);
                    },
                  ),
                ), Container(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        // 리스트뷰 스크롤 막기
                        shrinkWrap: true,
                        itemCount: 2,
                        //몇개의 리스트뷰 만들건지
                        itemBuilder: (context, index) {
                          return Card(
                              child: ListTile(
                              title: Container(
                              margin: EdgeInsets.fromLTRB(
                              size.height * 0.05, 0, size.height * 0.05,
                              size.height * 0.02),
                          padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
                          width: size.width * 0.9,
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,),
                          borderRadius: BorderRadius.circular(30),
                          ),
                              )
                          )
                          );

                        }
                    )
                )


                ],
              ),),
          ],
        ),
      ),
    );
  }
}
