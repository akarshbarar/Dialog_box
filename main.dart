import 'package:flutter/material.dart';
void main()=>runApp(Myapp());
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dialog Boxes Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.deepOrange,
      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Happy New Year 2019"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert),tooltip: "More Options",onPressed: (){},),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          RaisedButton(
            child: Text("Alert Dialog Box"),
            onPressed: (){

              showDialog<String>(
                context: context,
                builder: (BuildContext context)=>AlertDialog(
                  title:Text("Alert Dialog Box Title"),
                  content: Text("Data to be displayed"),
                  actions: <Widget>[
                    MaterialButton(
                      child: Text("Cancel"),
                      onPressed: ()=>Navigator.pop(context,"Cancel"),
                    ),
                    MaterialButton(
                      child: Text("OK"),
                      onPressed: ()=>Navigator.pop(context,"OK"),
                    ),
                  ],
                ),
              ).then<String>((resvalue){
                if(resvalue!=null){
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("You Clicked $resvalue"),
                    action: SnackBarAction(label: "OK", onPressed: (){}),
                    ),
                  );
                }
              });

            },
          ),
          RaisedButton(
            child: Text("Simple Dialog Box"),
            onPressed: (){

              showDialog<String>(
                context: context,
                builder: (BuildContext context)=>SimpleDialog(
                  title:Text("Alert Dialog Box Title"),
                  children:<Widget>[
                    ListTile(title: Text("ABC"),onTap: ()=>Navigator.pop(context,"ABC"),),
                    ListTile(title: Text("ABC1"),onTap: ()=>Navigator.pop(context,"ABC1"),),
                    ListTile(title: Text("ABC2"),onTap: ()=>Navigator.pop(context,"ABC2"),),
                  ],
                ),
              ).then<String>((resvalue){
                if(resvalue!=null){
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("You Clicked $resvalue"),
                      action: SnackBarAction(label: "OK", onPressed: (){}),
                    ),
                  );
                }
              });

            },
          ),
          RaisedButton(
            child: Text("Time Picker Dialog Box"),
            onPressed: (){

              DateTime obj=DateTime.now();
              showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: obj.hour, minute: obj.minute),
              ).then<TimeOfDay>((TimeOfDay obj){
                if(obj!=null){
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("${obj.format(context)}"),
                      action: SnackBarAction(label: "OK", onPressed: (){}),
                    ),
                  );
                }
              });

            },
          ),
          RaisedButton(
            child: Text("Date Picker Dialog Box"),
            onPressed: (){

              showDatePicker(
                context: context,
                initialDate:DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(3000),
              ).then<DateTime>((DateTime obj){
                if(obj!=null){
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("Selected date is $obj"),
                      action: SnackBarAction(label: "OK", onPressed: (){}),
                    ),
                  );
                }
              });

            },
          ),

        ],
      ),
    );
  }
}

