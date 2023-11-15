import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => FirstScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => SecondScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/third': (context) => ThirdScreen(),
    },
  ));
}

final myController = TextEditingController();
final myController2 = TextEditingController();

final myController3 = TextEditingController();
final myController4 = TextEditingController();
final myController5 = TextEditingController();

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Username'),
                enabled: false,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                maxLength: 10,
                controller: myController,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Password'),
                enabled: false,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                maxLength: 10,
                controller: myController2,
                obscureText: true,
                autofocus: true,
              ),
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                if (myController2.text == "student" &&
                    myController.text == "student") {
                  Navigator.pushNamed(context, '/second');
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FourthRoute()),
                  );
                }
                // Navigate to the second screen using a named route.
              },
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                myController.clear();
                myController2.clear();
                // Navigate back to the first screen by popping the current route// off the stack.
              },
              child: Text('Reset'),
            ),
          ])),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'From:'),
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  maxLength: 50,
                  controller: myController3,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'To:'),
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  maxLength: 50,
                  controller: myController4,
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                  ),
                  controller: myController5,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  if (myController3.text != "" ||
                      myController4.text != "" ||
                      myController5.text != "") {
                    Navigator.pushNamed(context, '/third');
                  } else {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Fields must not be empty'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  // Navigate back to the first screen by popping the current route// off the stack.
                },
                child: Text('Send Message'),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  myController3.clear();
                  myController4.clear();
                  myController5.clear();
                  // Navigate back to the first screen by popping the current route// off the stack.
                },
                child: Text('Reset'),
              ),
            ]),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Email Info'),
                        content: Text('From: ' +
                            myController3.text +
                            '\nTo: ' +
                            myController4.text +
                            '\nMessage: ' +
                            myController5.text),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Email Info'),
              ),
              FloatingActionButton(
                onPressed: () {
                  myController3.clear();
                  myController4.clear();
                  myController5.clear();

                  Navigator.pushNamed(context, '/second');
                },
                child: const Icon(Icons.navigation),
                backgroundColor: Colors.red,
              ),
            ]),
      ),
    );
  }
}

class FourthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fail login"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Login Failed'),
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),
            ]),
      ),
    );
  }
}
