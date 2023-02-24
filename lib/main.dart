import 'package:alertview_bloc_flutter/dialog/bloc/dialog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dialogBloc = DialogBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: BlocBuilder(
        bloc: _dialogBloc,
        builder: (BuildContext context, DialogState state) {
          if (state is DialogStateVisible) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(state.title),
                      content: Text(state.message),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              _dialogBloc.add(HideDialog());
                            },
                            child: Text('Cancel')),
                        TextButton(
                          onPressed: () {
                            print('HelloWorld!');
                            _dialogBloc.add(HideDialog());
                          },
                          child: Text('OK!'),
                        )
                      ],
                    );
                  });
              // Custom:

              // showDialog(
              //   context: context,
              //   barrierDismissible: false,
              //   builder: (_) {
              //     return Scaffold(
              //       body: Center(
              //         child: ElevatedButton(
              //           child: Text('dismiss'),
              //           onPressed: () {
              //             _dialogBloc.add(HideDialog());
              //           },
              //         ),
              //       ),
              //     );
              //   },
              // );
            });
          }
          if (state is DialogStateHidden) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pop(context);
            });
          }
          return Column(
            children: [
              Text('Dialog Sample'),
              ElevatedButton(
                onPressed: () {
                  _dialogBloc.add(const ShowDialog('Material Dialog Title','Hey! I am Coflutter!'));
                },
                child: Text('Show Error'),
              )
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _dialogBloc.close();
    super.dispose();
  }
}
