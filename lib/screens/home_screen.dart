import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cont = 0;

  void increase() {
    cont++;
    setState(() {});
  }

  void decrease() {
    cont--;
    setState(() {});
  }

  void reset() {
    cont = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        elevation: 0.0,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Número de clicks',
            style: fontSize30,
          ),
          Text('$cont', style: fontSize30),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increase,
        decreaseFn: decrease,
        resetFn: reset,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingActions({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => resetFn(),
          child: const Icon(Icons.account_balance_outlined),
        ),
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.add_alarm),
        ),
      ],
    );
  }
}
