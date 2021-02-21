import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoy_app/Modals/Task_data.dart';
import 'Tile.dart';
 class ListVieW extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {

    return ListView.builder(itemBuilder:(context,i){//inbuild List.
      return ListTileW(Provider.of<TaskData>(context,listen: false).tasks[i].isdone, 
      Provider.of<TaskData>(context).tasks[i].name,
      (bool val) async
  {
    /*setState(() {
      Provider.of<TaskData>(context).tasks[i].toggle();
    });*/
     await Provider.of<TaskData>(context,listen: false).cross(Provider.of<TaskData>(context,listen: false).tasks[i],i);


  },
  ()async
  {
    await Provider.of<TaskData>(context,listen: false).remove(Provider.of<TaskData>(context,listen: false).tasks[i],i);

  }
      
      
      );
    },
    itemCount:Provider.of<TaskData>(context,listen: false).tasks.length,
    );

 }
 }