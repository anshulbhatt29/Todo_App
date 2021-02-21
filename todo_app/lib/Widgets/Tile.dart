import 'package:flutter/material.dart';
class ListTileW extends StatelessWidget {

 final bool check;
 final String tileT;
 final Function  callback;
 final Function longp;
 ListTileW(this.check,this.tileT,this.callback,this.longp);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onLongPress: longp,
     title:Text(tileT,style: TextStyle( decoration:check? TextDecoration.lineThrough:null),),
     trailing:Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: check,
     onChanged: callback,
     ),
    );
  }
}

 /* void checkboxc(bool val)
  {
    setState(() {
      check=val;
    });

  }*/