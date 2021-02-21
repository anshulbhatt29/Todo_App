class Task{
  String name;
  bool isdone;
  Task(this.name,{this.isdone=false});
  void toggle()
  {
    isdone=!isdone;//value of current object is toggled.
  }
}
