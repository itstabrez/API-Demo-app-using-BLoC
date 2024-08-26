import 'package:flutter/material.dart';
import 'package:flutter_api_using_bloc_1/home/bloc/home_bloc.dart';
import 'package:flutter_api_using_bloc_1/widget/container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitEvent());
  }

  @override
  void dispose() {
    homeBloc
        .close(); // Don't forget to close the bloc when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Home Page"),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeSuccessState:
            final successData = state as HomeSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Home Page"),
              ),
              body: ListView.builder(
                itemCount: successData.postModel.length,
                itemBuilder: (context, index) {
                  final post = state.postModel[index];
                  return ContainerWidget.containerList(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(post.email as String),
                        subtitle: Text(
                          post.body as String,
                          maxLines: 4,
                        ),
                      ));
                },
              ),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
