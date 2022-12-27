import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'IconBtnWithCounter.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> listOfStrings = [
    'Shirts',
    'Pants',
    'Jackets',
    'Pullovers',
    'Shoes',
    'Accessories',
    'Hats',
  ];

  List listOfImages = [
    'assets/images/two.jpg',
    'assets/images/two.jpg',
    'assets/images/two.jpg',
    'assets/images/two.jpg',
    'assets/images/two.jpg',
    'assets/images/two.jpg',
    'assets/images/two.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.68,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search Product",
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: width * 0.1, vertical: 15),
                    )),
              ),
              IconBtnWithCounter(
                iconSrc: Icon(Icons.shopping_cart),
                numOfItems: 3,
                press: () {},
              ),
              IconBtnWithCounter(
                iconSrc: Icon(Icons.notifications),
                numOfItems: 3,
                press: () {},
              )
            ],
          ),
        ),
        Divider(),

        // Normal List
        Container(
          height: 250,
          //
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(150, 223, 211, 235),
                  ),
                  child: Column(children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          '${listOfImages[index]}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 75, bottom: 7),
                      child: Text('${listOfStrings[index]}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        'Lorem ipusem lorem...',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5),
                      child: RatingBar.builder(
                        initialRating: 0,
                        itemSize: 20,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ]),
                ),
              );
            },
            itemCount: listOfImages.length,
          ),
        ),

        Divider(),

        // New arrivals and View more button
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'New Arrivals',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              Spacer(),
              Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(width: 1, color: Colors.purple)))),
                    onPressed: () {},
                    child: Text('View More'),
                  ))
            ],
          ),
        ),

        Container(
          height: 225,
          //
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(150, 223, 211, 235),
                  ),
                  child: Column(children: [
                    Stack(children: [
                      Container(
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            '${listOfImages[index]}',
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 115),
                        child: FavoriteButton(
                          isFavorite: false,
                          iconDisabledColor: Colors.grey[400],
                          iconColor: Colors.red,
                          iconSize: 50,
                          valueChanged: (_isFavorite) {
                            print('Is Favorite : $_isFavorite');
                          },
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(right: 80, top: 10),
                      child: Text('Title',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: Text('Supporting text',
                          style: TextStyle(fontSize: 11)),
                    ),
                  ]),
                ),
              );
            },
            itemCount: 7,
          ),
        ),
      ])),
    );
  }
}
