import 'package:flutter/material.dart';
import '../customWidget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var sizeApp = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEBE100),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10),
                width: 200,
                height: 50,
                
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      labelText: 'Search', suffixIcon: Icon(Icons.search)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: sizeApp.height,
                width: sizeApp.width,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    //CATEGORY
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Category",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CategoryButton(
                              title: 'Food',
                              image: 'meat.png',
                              onPressed: () {
                                Navigator.pushNamed(context, 'Food');
                              },
                            ),
                            CategoryButton(
                              title: 'Drinks',
                              image: 'frappe.png',
                              onPressed: () {
                                Navigator.pushNamed(context, 'Drinks');
                              },
                            ),
                            CategoryButton(
                              title: 'Catering',
                              image: 'stew.png',
                              onPressed: () {
                                Navigator.pushNamed(context, 'Catering');
                              },
                            ),
                          ],
                        )
                      ],
                    ),

                    SizedBox(
                      height: 70,
                    ),

                    //Popular FOOD
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Popular Food",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Container(
                          width: sizeApp.width,
                          height: 200,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (__, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                                    child: Container(
                                  width: 200,
                                  height: 100,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('images/FoodSample.png'),
                                        Center(
                                            child: Text(
                                                'Ayam Goreng Khas Ganto Pawon',
                                                textAlign: TextAlign.center))
                                      ]),
                                ));
                              }),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
