import 'package:bloodapp/custom_styles.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);
  static const String id = "NewsScreen";
  @override
  State<NewsScreen> createState() => _HealthTipsScreenState();
}

class _HealthTipsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          title: Text('News & Blogs',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal)),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            color: Colors.white,
            //   height: 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  'Find the Latest Updates',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 54,
                ),
                TextField(
                    decoration: new InputDecoration(
                        labelText: "Search for news",
                        suffixIcon: Icon(Icons.search))),
                SizedBox(
                  height: 53,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: KColor4,
                          child: Icon(
                            Icons.healing,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Health'),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: KColor4,
                          child: Icon(
                            Icons.healing,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Health'),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: KColor4,
                          child: Icon(
                            Icons.healing,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Health'),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: KColor4,
                          child: Icon(
                            Icons.healing,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Health'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  'Featured Stories',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                Container(
                  //    height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  height: 500,

                  child: ListView(
                    children: [
                      ListTile(
                        leading: Image(image: AssetImage('images/News 1.png')),
                        title: Text(
                          'Commemotation of 2022 World Blood Day',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text('Read News'),
                      ),
                      ListTile(
                        leading: Image(image: AssetImage('images/News 2.png')),
                        title: Text(
                          'Commemotation of 2022 World Blood Day',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text('Read News'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
