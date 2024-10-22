import 'package:flutter/material.dart';
import 'package:http_request/core/services/baseNetwork.dart';
import 'package:http_request/data/responses/posts_model_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: BaseNetwork.get("posts"),
            builder: (context, snapshot){
              if(snapshot.hasData){
                List<PostsModelResponse> listData = List.empty(
                  growable: true
                );
                for(var d in snapshot.data!){
                  listData.add(PostsModelResponse.fromJson(d));
                }
                return ListView.builder(
                  itemCount: 10,
                    itemBuilder: (context,index){
                      return Text(listData[index].body);
                    }
                );
              }
              return CircularProgressIndicator();
            }
        )
      ),
    );
  }
}