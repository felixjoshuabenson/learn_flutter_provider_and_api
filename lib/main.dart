import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_provider/providers.dart';
import 'package:learn_provider/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ProvidersClass>(
      create: (context) {
        return ProvidersClass();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig:  router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Consumer<ProvidersClass>(builder: (context, v, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${v.counterHelp}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      v.increment();
                    },
                    child: Text('Increment'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      v.decrement();
                    },
                    child: Text('Decrement'),
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/news_file');
                  },
                  child: Text('News Section'),
                ),
              )
            ],
          ),
        );
      }),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
