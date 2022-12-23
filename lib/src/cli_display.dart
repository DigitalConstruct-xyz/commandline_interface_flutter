import 'package:flutter/material.dart';

cliDisplayBuilder(Stream<List<Widget>> stream){
   //display in a scrollable list
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              Widget item = snapshot.data![index];
              return Container(child: item);
            },
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );


}