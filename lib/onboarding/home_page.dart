import 'package:bloodapp/custom_styles.dart';
import 'package:bloodapp/custom_widgets/custom_container.dart';
import 'package:bloodapp/onboarding/donateblood_screen.dart';
import 'package:bloodapp/onboarding/request_blood.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1924, 500),
      ChartData(1925, 410),
      ChartData(1926, 405),
      ChartData(1927, 410),
      ChartData(1928, 400),
      ChartData(1929, 370),
      ChartData(1930, 500),
      ChartData(1931, 390),
      ChartData(1932, 450),
      ChartData(1933, 440),
      ChartData(1934, 400),
      ChartData(1935, 370),
      ChartData(1936, 480),
      ChartData(1937, 410),
      ChartData(1938, 500),
      ChartData(1939, 500),
      ChartData(1940, 390),
      ChartData(1941, 360),
      ChartData(1942, 405),
      ChartData(1943, 500),
    ];
    final List<Color> color = <Color>[];
    color.add(Color.fromARGB(255, 227, 242, 253));
    color.add(Color.fromARGB(255, 144, 202, 249));
    color.add(Colors.blue);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: KColor1,
                  ),
                  Text('Accra', style: TextStyle(color: KColor1))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, top: 10),
              child: Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width,
                height: 210,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('GIVE THE GIFT OF LIFE',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: KColor1, fontSize: 36),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Donate ',
                              ),
                              TextSpan(
                                  text: 'Blood',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: KColor1,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        '157',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 36),
                                      ),
                                      Text(
                                        'New Blood\nRequested',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: KColor2,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        '15K',
                                        style: TextStyle(
                                            color: KColor3, fontSize: 36),
                                      ),
                                      Text(
                                        'Save Lives',
                                        style: TextStyle(
                                            color: KColor3, fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style:
                            TextStyle(color: Color(0xFF6B6B6B), fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Each Donation can help save up to ',
                          ),
                          TextSpan(
                              text: '3 lives!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                        child: Container(
                            height: 200,
                            child: SfCartesianChart(
                                primaryXAxis: NumericAxis(
                                  isVisible: false,
                                  //Hide the gridlines of x-axis
                                  majorGridLines: MajorGridLines(width: 0),
                                  //Hide the axis line of x-axis
                                  axisLine: AxisLine(width: 0),
                                ),
                                primaryYAxis: NumericAxis(
                                    isVisible: false,

                                    //Hide the gridlines of y-axis
                                    majorGridLines: MajorGridLines(width: 0),
                                    //Hide the axis line of y-axis
                                    axisLine: AxisLine(width: 0)),
                                plotAreaBorderWidth: 0,
                                //   primaryYAxis: NumericAxis(labelFormat: '{value}m3'),
                                series: <ChartSeries>[
                                  // Renders area chart
                                  SplineAreaSeries<ChartData, int>(
                                      trendlines: <Trendline>[
                                        Trendline(
                                            type: TrendlineType.movingAverage,
                                            color: Colors.blue)
                                      ],
                                      dataSource: chartData,
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y,
                                      gradient: gradientColors),
                                ]))),
                    SizedBox(
                      height: 150,
                    )
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 160,
                  child: Container(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 255, 255, 255),
                            spreadRadius: 30,
                            blurRadius: 10),
                        //BoxShadow
                      ],
                    ),
                    height: 250,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RequestBloodScreen.id);
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomContainer(
                                      firstwidget: CircleAvatar(
                                        backgroundColor: KColor2,
                                        child: Icon(
                                          Icons.water_drop_outlined,
                                          color: KColor3,
                                        ),
                                      ),
                                      secondWidget: Text(
                                        'Request',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      thirdWidget: Container(
                                        // height: 10,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8),
                                          child: Text(
                                            'Map',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: KColor2,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  Navigator.pushNamed(context, DonateBlood.id);
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomContainer(
                                      firstwidget: CircleAvatar(
                                        backgroundColor: KColor2,
                                        child: Icon(
                                          Icons.handshake,
                                          color: KColor3,
                                        ),
                                      ),
                                      secondWidget: Text(
                                        'Donate',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      thirdWidget: Container(
                                        // height: 10,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8),
                                          child: Text(
                                            '500k',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: KColor2,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomContainer(
                                    firstwidget: CircleAvatar(
                                      backgroundColor: KColor2,
                                      child: Icon(
                                        Icons.search,
                                        color: KColor3,
                                      ),
                                    ),
                                    secondWidget: Text(
                                      'Consult',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                    thirdWidget: Container(
                                      // height: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8),
                                        child: Text(
                                          '235k',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: KColor2,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomContainer(
                                    firstwidget: CircleAvatar(
                                      backgroundColor: KColor2,
                                      child: Icon(
                                        Icons.health_and_safety,
                                        color: KColor3,
                                      ),
                                    ),
                                    secondWidget: Text(
                                      'Hospital',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                    thirdWidget: Container(
                                      // height: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8),
                                        child: Text(
                                          'More',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: KColor2,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}
