import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculate',
      home: NumberGrid(),
    );
  }
}

class NumberGrid extends StatefulWidget {
  const NumberGrid({Key? key}) : super(key: key);

  @override
  _NumberGridState createState() => _NumberGridState();
}

class _NumberGridState extends State<NumberGrid> {
  String _currentNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Call',
            style: TextStyle(fontSize: 26, color: Color.fromARGB(255, 248, 251, 250)),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 20, 19, 19),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _currentNumber,
            style: const TextStyle(fontSize: 50),
          ),
          const SizedBox(height: 100),
          Center(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_currentNumber.isNotEmpty) {
                          _currentNumber = _currentNumber.substring(0, _currentNumber.length - 1);
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 19, 15, 15),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.backspace,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  );
                } else if (index < 4) {
                  String specialCharacter = ['#', '0', '*'][index - 1];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentNumber += specialCharacter;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 12, 12, 12),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          specialCharacter,
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                } else {
                  String number = (index - 3).toString();
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentNumber += number;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 12, 12, 12),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          number,
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }
              },
              itemCount: 12,
            ),
          ),
        ],
      ),
    );
  }
}
