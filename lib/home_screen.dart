import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstNumTEcontroller = TextEditingController();
  final TextEditingController _secondNumTEcontroller = TextEditingController();
  double _result = 0;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Calculator'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNumTEcontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'First Number',
                      label: Text('First Number'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      )),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a value';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _secondNumTEcontroller,
                  decoration: const InputDecoration(
                      hintText: 'Second Number',
                      label: Text('Second Number'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      )),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a value';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                _buildButtonBar(),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Result: ${_result.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildButtonBar() {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              _onTapAdd();
            },
            icon: const Icon(Icons.add)),
        IconButton(
            onPressed: () {
              _onTapSubstract();
            },
            icon: const Icon(Icons.remove)),
        TextButton(
            onPressed: () {
              _onTapMultiplication();
            },
            child: const Text(
              '*',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            )),
        TextButton(
            onPressed: () {
              _onTapDivide();
            },
            child: const Text(
              '/',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            )),
      ],
    );
  }

  void _onTapAdd() {
    if (_formkey.currentState!.validate() == false) {
      return;
    }
    double firstNumber = double.tryParse(_firstNumTEcontroller.text) ?? 0;
    double secondNumber = double.tryParse(_secondNumTEcontroller.text) ?? 0;
    _result = firstNumber + secondNumber;

    setState(() {});
  }

  void _onTapSubstract() {
    if (_formkey.currentState!.validate() == false) {
      return;
    }
    double firstNumber = double.tryParse(_firstNumTEcontroller.text) ?? 0;
    double secondNumber = double.tryParse(_secondNumTEcontroller.text) ?? 0;
    _result = firstNumber - secondNumber;

    setState(() {});
  }

  void _onTapMultiplication() {
    if (_formkey.currentState!.validate() == false) {
      return;
    }
    double firstNumber = double.tryParse(_firstNumTEcontroller.text) ?? 0;
    double secondNumber = double.tryParse(_secondNumTEcontroller.text) ?? 0;
    _result = firstNumber * secondNumber;

    setState(() {});
  }

  void _onTapDivide() {
    if (_formkey.currentState!.validate() == false) {
      return;
    }
    double firstNumber = double.tryParse(_firstNumTEcontroller.text) ?? 0;
    double secondNumber = double.tryParse(_secondNumTEcontroller.text) ?? 0;
    _result = firstNumber / secondNumber;

    setState(() {});
  }

  @override
  void dispose() {
    _firstNumTEcontroller.clear();
    _secondNumTEcontroller.clear();
    super.dispose();
  }
}
