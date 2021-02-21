
import 'package:flutter/cupertino.dart';
import 'package:todoy_app/Modals/Task.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier{
      List<Task> tasks=[
  ];
  List<String> p=[];
  List<bool> c=[];//remove.
  List<String>s=[];
Future<void> current() async
  {
      final SharedPreferences prefs=await SharedPreferences.getInstance();
      if(prefs.getStringList('List')!=null){
      List<String> l1=prefs.getStringList('List');
      List<String>l2=prefs.getStringList('List1');
      p=l1;
      s=l2;
      tasks.clear();
      int k=0;
      bool b;
      for(String j in p){
        //int x=int.parse(s[k]);
        if(s[k]=='true')
        {
          b=true;
        }
        else
        b=false;
        tasks.add(Task(j));
        if(b){
        tasks[k].isdone=!(tasks[k].isdone);
        }
        k++;

      }
      notifyListeners();
      }

  }
  Future<void> addtask(String newTask) async
  {
 
    final task=Task(newTask);
   
    tasks.add(task);
     p.add(newTask);
     s.add('false');

       final SharedPreferences prefs=await SharedPreferences.getInstance();
     
    await prefs.setStringList('List', p);
    await prefs.setStringList('List1', s);
    notifyListeners();

  }
 Future<void> cross(Task t,int i)async
  { 
    bool y=!(t.isdone);
    if(y)
    {
      s[i]='true';

    }
    else{
      s[i]='false';
    }
       t.toggle();
      final SharedPreferences prefs=await SharedPreferences.getInstance();
    
     await prefs.setStringList('List1', s);
     notifyListeners();
   // Task.toggle()

  }
  Future<void> remove(Task t ,int i)async
  {
    
          p.remove(p[i]);
     s.remove(s[i]);
     
    tasks.remove(t);
     final SharedPreferences prefs=await SharedPreferences.getInstance();

      await prefs.setStringList('List', p);
      await prefs.setStringList('List1', s);
       notifyListeners();
  }

}