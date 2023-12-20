import 'package:dioflutter/IteamWiget.dart';
import 'package:dioflutter/network/network_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(home: BlocProvider(
    create: (context) => NetworkCubit(),
    child: MyApp(),
  ),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
    BlocProvider.of<NetworkCubit>(context).yuklash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<NetworkCubit, NetworkState>(
          builder: (context, state) {
            if(state is NetworkLoading){
              return Center(
                child:  CircularProgressIndicator(),
              );
            }
            else if (state is NetworkSuccess){
              return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index){
                    return  ItemWidget(post: state.list[index]);
                  });
            }
            else if(state is NetworkErorr){
              return Center(child: Text(state.massenge.toString()),);
            }
            else{
              return Text("Nomalum");
            }
          }
      ),
    );
  }
}
