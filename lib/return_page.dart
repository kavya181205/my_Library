import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Borrowdata.dart';
import 'package:my_library/listbilds.dart';
class Returnpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return _Returnpage();
  }
}
class _Returnpage extends State<Returnpage>{
  final TextEditingController _controller= TextEditingController();
  int check=0;
  int check2=1;
  String stime='';
  late DateTime selectedDate; // Initializes with current date and time

  List<Borrow> BorrowList=borrowList;
  void search(){
    setState(() {
      if(check2==1){
        check2=0;
      }
      if(check2==0){
        String input;
        input="";
        if(_controller.text.length>0){
          input=_controller.text;
          BorrowList=[];
          for(var i in borrowList){
            if(i.bookId.toString().contains(input) || i.userId.toString().contains(input) || i.transactionId.toString().contains(input)){
              BorrowList.add(i);
            }
          }
        }
      }
    });
  }
  void filt(date){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Container(
          child: Row(
            children: [
              if(check2==1)
                Container(
                  width: MediaQuery.of(context).size.width*0.60,
                  child: Text("ReturnPage"),
                ),
              if(check2==0)
                Row(
                  children: [
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(
                          left:5,
                          right:5,
                          top:5,
                          bottom:10
                      ),
                      width: MediaQuery.of(context).size.width*0.6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(7))
                      ),
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          labelText: "search",
                          labelStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.black
                          ),
                          border:OutlineInputBorder(),
                          hintText: "BookId,Userid,transactionId",
                          hintStyle: TextStyle(fontSize: 20,color: Colors.grey),
                          contentPadding: EdgeInsets.only(top: 2),

                        ),
                      ),
                    ),

                  ],
                ),
              IconButton(onPressed: search, icon: Icon(Icons.search))
            ],
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black12,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey),top: BorderSide(color: Colors.grey)),
                ),
                child: Row(
                  children: [
                    Text("return date: " ,style: TextStyle(fontSize: 20),),
                    Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width*0.6,
                      child: Row(
                        children: [
                          if(stime.isNotEmpty)
                            Text(stime ,style: TextStyle(fontSize: 20),),
                          DatePickerWidget(onDateSelected:(date) {
                            setState(() {
                              selectedDate = date;
                              stime = selectedDate.toString();
                              stime = stime.split(" ")[0];
                              List<Borrow> temp = BorrowList;
                              BorrowList = [];
                              for (var i in temp) {
                                if (selectedDate != Null) {
                                  if (i.returnDate.isBefore(selectedDate) ||
                                      i.returnDate == selectedDate) {
                                    BorrowList.add(i);
                                  }
                                }
                              }
                            });
                          } ),
                        ],
                      )
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.8,
                child: Borowlistbilt(bolist: BorrowList),
              )

            ],
          ),
        ),
      ),
    );
  }
}