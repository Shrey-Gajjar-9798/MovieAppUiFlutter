import 'package:flutter/material.dart';
import 'package:internmovie/items.dart';

class HomeDetail extends StatelessWidget {
  Item item;
  final List<Item> remain;
  HomeDetail({
    required this.item,
    required this.remain,
  });

  void onBack() {
    remain.removeRange(0, remain.length);
    print("remain length is : ${remain.length}");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBack();
        return true;
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 410,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: item.bgimage, fit: BoxFit.cover),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.2),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              print("pressed");
                            },
                            padding: EdgeInsets.all(0),
                            icon: Icon(
                              Icons.play_circle_fill_rounded,
                              size: 40,
                            ),
                            color: Colors.white,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 15,
                        child: Row(
                          children: [
                            Container(
                              height: 180,
                              width: 130,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image(
                                  image: item.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15, top: 12),
                              height: 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Text(
                                      item.type,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        // fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        item.rating.toString(),
                                        style: TextStyle(color: Colors.white60),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Description about the films goes here. Based on the New York times it is wonderful movie with best dialogues and acting",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Watch Now"),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                        Size((MediaQuery.of(context).size.width) - 40, 40)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Similar movies",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 290,
                  // margin: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: remain.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 230,
                                  width: 170,
                                  child: Card(
                                    // margin: EdgeInsets.all(7),
                                    semanticContainer: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image(
                                      image: remain[i].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, top: 8.0, bottom: 4.0),
                                child: Text(remain[i].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: EdgeInsets.all(2),
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text(
                                        remain[i].type,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                      Text(
                                        remain[i].rating.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
