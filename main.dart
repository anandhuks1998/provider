import 'package:flutter/material.dart';
import 'package:projects/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ApiTestingProvider())
  ], child: const TestApiRootWidget()));
}

class TestApiRootWidget extends StatefulWidget {
  const TestApiRootWidget({super.key});

  @override
  State<TestApiRootWidget> createState() => _TestApiRootWidgetState();
}

class _TestApiRootWidgetState extends State<TestApiRootWidget> {
  @override
  void initState() {
    context.read<ApiTestingProvider>().apiTesting();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<ApiTestingProvider>(builder: (context, value, child) {
        return value.apiData == null
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                appBar: AppBar(
                  title: Text("API Test"),
                  centerTitle: true,
                ),
                body: Container(
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: value.apiData.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(value.apiData[index].title.toString()),
                            Image.network(
                                value.apiData[index].imageurl.toString())
                          ],
                        );
                      }),
                ),
              );
      }),
    );
  }
}
