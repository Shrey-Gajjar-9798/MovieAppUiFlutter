import 'package:flutter/material.dart';
import 'package:internmovie/homedetailpage.dart';
import 'package:internmovie/items.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> remains = [];
  List<Item> items = [
    Item(
        image: AssetImage("assets/blackpanther.jpg"),
        name: "Black Panther",
        rating: 8.7,
        bgimage: AssetImage("assets/bgblackpanther.jpg"),
        type: "action"),
    Item(
        image: AssetImage("assets/kabirsingh.jpg"),
        bgimage: AssetImage("assets/bgkabirsingh.jpg"),
        name: "Kabir Singh",
        rating: 9,
        type: "love"),
    Item(
        image: AssetImage("assets/kgf.jpg"),
        bgimage: AssetImage("assets/bgkgf.jpg"),
        name: "KGF",
        rating: 9.2,
        type: "action"),
    Item(
        image: AssetImage("assets/lionking.jpg"),
        bgimage: AssetImage("assets/bglion.jpeg"),
        name: "The lion king",
        rating: 8.4,
        type: "Cartoon"),
    Item(
        image: AssetImage("assets/realsteal.jpg"),
        bgimage: AssetImage("assets/bgrealsteal.jpg"),
        name: "Real Steal",
        rating: 9,
        type: "action"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navigation(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderImage(),
              FeaturedRow(),
              Container(
                height: 280,
                // margin: EdgeInsets.all(10),
                width: double.infinity,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                for (var m = 0; m < items.length; m++) {
                                  if (m == i) {
                                    continue;
                                  } else {
                                    remains.add(items[m]);
                                    print(remains.length);
                                  }
                                }
                                // remains.addAll(items.skip(i));
                                print("items :$items ${items.length}");
                                print("Remains : $remains ${remains.length}");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeDetail(
                                              item: items[i],
                                              remain: remains,
                                            )));
                              },
                              child: Container(
                                height: 230,
                                width: 170,
                                child: Card(
                                  // margin: EdgeInsets.all(7),
                                  semanticContainer: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image(
                                    image: items[i].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 8.0),
                              child: Text(items[i].name,
                                  style: TextStyle(
                                      color: Colors.black,
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
                                      items[i].type,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                    Text(
                                      items[i].rating.toString(),
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
              CategoriesRow(),
              CategoriesScroll(),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Categories",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
          TextButton(
            onPressed: () {},
            child: Text(
              "See All",
              style: TextStyle(fontSize: 12),
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class FeaturedRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Featured",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
          TextButton(
            onPressed: () {},
            child: Text(
              "See All",
              style: TextStyle(fontSize: 12),
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/family-man.jpg"), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.7),
              Colors.white.withOpacity(0.4),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Movie Title",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Watch Now",
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  fixedSize: MaterialStateProperty.all(Size(150, 40)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
            ),
          ],
        ),
      ),
    );
  }
}

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_movies_rounded), label: "Films"),
        BottomNavigationBarItem(icon: Icon(Icons.live_tv_rounded), label: "Tv"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined), label: "Account"),
      ],
      backgroundColor: Colors.white,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.red.withOpacity(0.6),
      // iconSize: 14,
      currentIndex: 0,
    );
  }
}

class CategoriesScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
              margin: EdgeInsets.all(8),
              height: 80,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                      image: AssetImage("assets/family-man.jpg"),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Action & Adventure",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    Text(
                      "Movies & tv",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )),
          Container(
              margin: EdgeInsets.all(8),
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: AssetImage("assets/harry.jpg"),
                    fit: BoxFit.cover,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Family",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "Movies & tv",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                ),
              )),
          Container(
              margin: EdgeInsets.all(8),
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: AssetImage("assets/drama.jpg"),
                    fit: BoxFit.cover,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Drama",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "Movies & tv",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                ),
              )),
          Container(
              margin: EdgeInsets.all(8),
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: AssetImage("assets/comedy.jpg"),
                    fit: BoxFit.cover,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Comedy",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "Movies & tv",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
