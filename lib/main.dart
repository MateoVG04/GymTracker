import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromRGBO(0, 0, 0, 1.0), // DodgerBlue (RGB: 30, 144, 255)
          onPrimary: Colors.white,
          secondary: Color.fromRGBO(255, 165, 0, 1.0), // Orange (RGB: 255, 165, 0)
          onSecondary: Colors.black,
          error: Color.fromRGBO(220, 20, 60, 1.0), // Crimson (RGB: 220, 20, 60)
          onError: Colors.white,
          background: Color.fromRGBO(240, 248, 255, 1.0), // AliceBlue (RGB: 240, 248, 255)
          onBackground: Colors.black,
          surface: Color.fromRGBO(255, 255, 255, 1.0), // White (RGB: 255, 255, 255)
          onSurface: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Gym Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String splitName = "";
  List<String> items = [];
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  // Future<void> wordt gebruikt bij functies die asynchroon werken zoals
  // showDialog.
  Future<void> _addSplit(String type) async{
    String userInput ="";
    return showDialog<void>(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text( (type == "add")
            ? "Give your workout split a name:"
            : "Edit your workout split:",
            style: TextStyle(
              fontSize: 20.0
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children:[
              TextField(
                onChanged: (value) {
                  userInput = value;
                },
                decoration: const InputDecoration(
                    hintText: "split name",
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Color.fromRGBO(215, 215, 215, 1.0),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(240, 240, 240, 1.0)
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16.0)
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                      TextButton(
                        child: const Text(
                          "close",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black
                        ),
                        onPressed: (){
                        Navigator.of(context).pop();
                  },
                ),
                      TextButton(
                        child: const Text(
                            "save",
                            style: TextStyle(
                              color: Colors.white
                            ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black
                        ),
                        onPressed: (){
                        setState(() {
                          if(userInput!="") {
                            items.add(userInput);
                          }
                      });
                        Navigator.of(context).pop();
                      },
                      )
                ]
              )
            ]
          ),
        );
      }
    );
  }

  void _deleteSplit(int index){
    setState(() {
      if(items.isNotEmpty){
        items.removeAt(index);
      }
    });
  }

  void _editSplit(int index){
    setState(() {
      String editName = "";
      _addSplit("edit");
      editName = items[items.length-1];
      items[index] = editName;
      items.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = 70.0;
    double buttonHeigth = 45.0;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),
        centerTitle: true,

      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.

          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(top:15.0)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Met deze sizedBox kan je de grootte van je buttons bepalen
                SizedBox(
                  // de waardes van de grootte van de buttons kan je bovenaan in
                  // de widget bepalen
                  width:buttonWidth,
                  height:buttonHeigth,
                  child: ElevatedButton(
                    onPressed: () => _deleteSplit(0),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,

                    ),
                    child: Icon(
                        Icons.remove,
                        color: Theme.of(context).colorScheme.onPrimary
                    ),
                  ),
                ),
                SizedBox(
                  width:buttonWidth,
                  height:buttonHeigth,
                  child: ElevatedButton(
                    onPressed: () => _addSplit("add"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,

                    ),
                    child: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.onPrimary
                    ),
                  ),
                ),
              ]
            ),
            Padding(
                padding: const EdgeInsets.only(top:10.0)
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                      height: 100,
                      color: (index%2 == 0)
                        ? Color.fromRGBO(250, 250, 250, 1.0)
                        : Color.fromRGBO(230, 230, 230, 1.0),
                      child: Row(
                          children:[
                            Expanded(
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () => _editSplit(index),
                                    style: IconButton.styleFrom(
                                        iconSize: 15
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () => _deleteSplit(index),
                                    style: IconButton.styleFrom(
                                        iconSize: 15
                                    ),
                                  ),
                                ]
                            ),
                          ]
                      ),
                    );
                  },
                separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white),
              )
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
