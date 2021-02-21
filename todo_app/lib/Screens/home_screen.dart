import 'package:flutter/material.dart';
import 'package:todoy_app/Widgets/List.dart';
import 'package:provider/provider.dart';
import 'package:todoy_app/Modals/Task_data.dart';


  String ans;
  class Homescreen extends StatefulWidget {
    @override
    _HomescreenState createState() => _HomescreenState();
  }
  
  class _HomescreenState extends State<Homescreen> {
    void initState()
    {
      super.initState();
      getTasklist();
     //await Provider.of<TaskData>(context,listen: false).current();
    }
  void getTasklist()async
    {
     await Provider.of<TaskData>(context,listen: false).current();
   
    }
  
 Widget bottomB(BuildContext context)
  {
    return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(20.0),
                    decoration:BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(20.0),
                        topRight:Radius.circular(20.0),
                      ),
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         children:[
                           Text('ADD TASK',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             fontSize:30.0,
                             color:Colors.black,
                           ),
                           ),
                           TextField(
                             autofocus: true,//keyboard will be open.
                             textAlign: TextAlign.center,
                             onChanged: (val){
                               ans=val;
                             },
                           ),
                           FlatButton(
                             child: Text('ADD',style:TextStyle(
                               color:Colors.pinkAccent,//styling of text.

                             ),
                             ),
                               color: Colors.cyanAccent,//styling of button.
                             onPressed:() async
                             {
                               //setState(() {
                                 //  tasks.add(Task(ans));
                                 
                               //});
                               if(ans!=null){
                           
                          await  Provider.of<TaskData>(context,listen: false).addtask(ans);
                               }
                               ans=null;
                            

                               Navigator.pop(context);//remove bottom window after typing.
                             }
                             
                           ),
                         ]
                       ),

        ),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.cyanAccent,
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.cyanAccent,
      child: Icon(Icons.add),
      onPressed: ()
      {
        showModalBottomSheet(context:context,isScrollControlled: true, builder:bottomB);//isScrollControlled.
      },
      ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top:60.0,bottom:30.0,left:30.0,right:30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                CircleAvatar(child: Icon(Icons.list,size:30.0,),
                backgroundColor: Colors.white,
                ),
                   SizedBox(
                  height:10.0,
                ),
                Text('TODO_LIST',style: TextStyle(
                fontSize:50.0,
                fontWeight:FontWeight.bold,
                color:Colors.white,
                ),
                ),
             
                Text('${Provider.of<TaskData>(context).tasks.length}',//access.
                  style:TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                  ),
                

              ]
            ),
          ),
            Expanded(
                    child: Container(
                  decoration:BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(20.0),
                      topRight:Radius.circular(20.0),
                    ),
                     ),
                     child: ListVieW(),

                ),
              ),
        ],
      )
      
    );
  }
}
 
//Passing values through constructor.
