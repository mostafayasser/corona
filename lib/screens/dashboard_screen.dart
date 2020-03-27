import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconRenderer extends charts.CustomSymbolRenderer {
  final IconData iconData;

  IconRenderer(this.iconData);

  @override
  Widget build(BuildContext context,
      {Size size, Color color, bool enabled}) {
    return new SizedBox.fromSize(
        size: size, child: new Icon(iconData, color: color, size: 12.0));
  }
}

class DashboardScreen extends StatefulWidget {
  static const route = "/dashboardScreen";
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<charts.Series<Info, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Cases, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      Info(type: "Male", range: "-10", num: 45),
      Info(type: "Female", range: "-10", num: 55),
    ];
    var data2 = [
      Info(type: "Male", range: "10 - 20", num: 24),
      Info(type: "Female", range: "10 - 20", num: 6),
    ];
    var data3 = [
      Info(type: "Male", range: "21 - 40", num: 30),
      Info(type: "Female", range: "21 - 40", num: 20),
    ];
    var data4 = [
      Info(type: "Male", range: "41 - 50", num: 10),
      Info(type: "Female", range: "41 - 50", num: 10),
    ];
    var data5 = [
      Info(type: "Male", range: "+50", num: 70),
      Info(type: "Female", range: "+50", num: 80),
    ];

    var piedata = [
      new Task('Not infected', 27.5, Color(0xff109618)),
      new Task('Infected', 72.5, Color(0xfffdbe19)),

    ];

    var lineCasesdata = [ //infected
      new Cases(0, 0),
      new Cases(1, 10),
      new Cases(2, 50),
      new Cases(3, 150),
      new Cases(4, 270),
     // new Cases(5, 350),
    ];
    var lineCasesdata1 = [ //dead
      new Cases(0, 0),
      new Cases(1, 1),
      new Cases(2, 5),
      new Cases(3, 11),
      new Cases(4, 16),
     // new Cases(5, 20),
    ];

    var lineCasesdata2 = [ //recovered
      new Cases(0, 0),
      new Cases(1, 10),
      new Cases(2, 30),
      new Cases(3, 55),
     new Cases(4, 79),
      //new Cases(5, 100),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Info info, _) => info.type,
        measureFn: (Info info, _) => info.num,
        id: '-10',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Info info, _) => info.type,
        measureFn: (Info info, _) => info.num,
        id: '10-20',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Info info, _) => info.type,
        measureFn: (Info info, _) => info.num,
        id: '21-40',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Info info, _) => info.type,
        measureFn: (Info info, _) => info.num,
        id: '41-50',
        data: data4,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
       
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Info info, _) => info.type,
        measureFn: (Info info, _) => info.num,
        id: '+50',
        data: data5,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
       

      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Infected',
        data: lineCasesdata,
        domainFn: (Cases cases, _) => cases.week,
        measureFn: (Cases cases, _) => cases.numOfPeople,
        measureLowerBoundFn: (datum, index) => 0,
        measureUpperBoundFn: (datum, index) => 300,
        measureOffsetFn: (datum, index) => 0,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Dead',
        data: lineCasesdata1,
        domainFn: (Cases cases, _) => cases.week,
        measureFn: (Cases cases, _) => cases.numOfPeople,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Recovered',
        data: lineCasesdata2,
        domainFn: (Cases cases, _) => cases.week,
        measureFn: (Cases cases, _) => cases.numOfPeople,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Info, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Cases, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop()),
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
            title: Text('Admin dashboard'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Gender and Age distribution',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            
                            //animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            behaviors: [new charts.SeriesLegend()],
                            //animationDuration: Duration(seconds: 5),
                            defaultRenderer: new charts.BarRendererConfig(
                                symbolRenderer: IconRenderer(Icons.cloud),)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Infected people who interacted with foriengers vs not infected ',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: charts.PieChart(_seriesPieData,
                              animate: true,
                              animationDuration: Duration(seconds: 5),
                              behaviors: [
                                new charts.DatumLegend(
                                  outsideJustification:
                                      charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding: new EdgeInsets.only(
                                      right: 4.0, bottom: 4.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts
                                          .MaterialPalette.purple.shadeDefault,
                                      fontFamily: 'Georgia',
                                      fontSize: 11),
                                )
                              ],
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 100,
                                  arcRendererDecorators: [
                                    new charts.ArcLabelDecorator(
                                        labelPosition:
                                            charts.ArcLabelPosition.inside)
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Cases for the first 5 weeks',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: charts.LineChart(_seriesLineData, 
                              defaultRenderer: new charts.LineRendererConfig(symbolRenderer:  IconRenderer(Icons.cloud), includePoints: true,
                                  includeArea: false, stacked: false ),
                              animate: true,
                              animationDuration: Duration(seconds: 5),
                              behaviors: [
                                charts.SeriesLegend(),
                                new charts.ChartTitle('Weeks',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Number of people',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Info {
  String range;
  String type;
  int num;

  Info({this.num, this.range, this.type});
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Cases {
  int week;
  int numOfPeople;

  Cases(this.week, this.numOfPeople);
}
