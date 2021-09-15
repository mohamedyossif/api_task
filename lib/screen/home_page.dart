import 'package:api_task_iti/model/movie.dart';
import 'package:api_task_iti/service/networking.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movie"),
      ),
      body: FutureBuilder<List<Movie>>(
        future: Networking.getData(),
        builder: (context, snapshpt) {
          if(snapshpt.hasError)
          {
            return Text("error");
          }
          else if(snapshpt.connectionState==ConnectionState.waiting)
          {
            return Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 320,
          ),
          itemCount: snapshpt.data!.length,
          itemBuilder: (c, index) {
            return Container(
              margin: EdgeInsets.all(3.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(
                        'http://image.tmdb.org/t/p/w500${snapshpt.data![index].poster_path}',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.3,
                        fit: BoxFit.fitWidth,
                      ),
                      Text('${snapshpt.data![index].title}',style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                      ),
                      Text('${snapshpt.data![index].release_date}',
                      style: TextStyle(color: Colors.blue[900]),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text('${snapshpt.data![index].vote_average} ⭐'),
                       Icon(Icons.favorite_rounded,color: Colors.pink,),
                      ],)
                    ],
                  ),
                ),
              ),
            );
          },
        );
        }
      ),
    );
  }
}
