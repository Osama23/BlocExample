import 'package:BlocExamples/presentation/screens/second_screen.dart';
import 'package:BlocExamples/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BlocExamples/logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final Color color;
  HomeScreen({Key key, this.title, this.color}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Incremented'),
                      duration: Duration(microseconds: 300),
                    ),
                  );
                } else if (state.wasIncremented == false) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Decremented'),
                      duration: Duration(microseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: "btn1",
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                    //context.bloc<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () {
                    //BlocProvider.of<CounterCubit>(context).decrement,
                    context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (_) => BlocProvider.value(
                //       value: BlocProvider.of<CounterCubit>(context), // CounterCubit() wrong
                //       child: SecondScreen(
                //         color: Colors.redAccent,
                //         title: 'Second Screen',
                //       ),
                //     ),
                //   ),
                // );
                Navigator.of(context).pushNamed(
                  '/second',
                );
              },
              child: Text(
                'Go To Second Screen',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.greenAccent,
              child: Text(
                'Go to Third Screen',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => ThirdScreen(
                //       color: Colors.redAccent,
                //       title: 'Second Screen',
                //     ),
                //   ),
                // );
                Navigator.of(context).pushNamed(
                  '/third',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
