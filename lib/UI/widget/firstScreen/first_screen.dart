import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/UI/controller/firstScreen/first_screen_controller.dart';


class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});
  final FirstScreenController _controller = Get.put(FirstScreenController());


  @override
  Widget build(BuildContext context) {
   
   return  Scaffold(
    body: SafeArea(
      child: Padding(padding:EdgeInsets.only(left: 20,top: 40) ,
        child: Stack(
          children: [
              
      Obx(() =>      ListView.builder(
            shrinkWrap: true,
            itemCount: _controller.test.length, itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Container(
                color: Colors.blue[200],
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: (){
                          if(_controller.check[index] == "1"){
                            _controller.check[index] = "0";
                             _controller.saveList();

                          }else{
                          _controller.check[index] = "1";
                           _controller.saveList();

                          }
                        },
                        child: Obx(() =>  Container(height: 20,width: 20,color: _controller.check[index]=="1"?Colors.blue: Colors.white,child:_controller.check[index]=="1"? Icon(Icons.check,size: 17,):null,)))),
                    Text(_controller.test[index],style:const TextStyle(fontSize: 18, color: Colors.black45,fontWeight:FontWeight.bold, ),),
                    GestureDetector(
                      onTap: (){
                        _controller.test.removeAt(index);
                        _controller.check.removeAt(index);
                        _controller.saveList();

      
                      },
                      child:const Padding(
                        padding: const EdgeInsets.only(right:10.0),
                        child: Icon(Icons.delete,size: 30,color: Colors.red,),
                      ))
                  ],
                )),
            );
          }),),
           Padding(
             padding: const EdgeInsets.only(bottom:10.0,right: 10),
             child: Align(
              alignment: Alignment.bottomRight ,
               child: GestureDetector(
                onTap: (){
                  showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              
              builder: (context) {
                return Padding(
                 padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    height: 200,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 50,),
                        TextField(
                          controller: _controller.enterTask,
                          decoration: InputDecoration(
                            labelText: 'Enter Task',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Action for saving
                          // Close the BottomSheet
                          if(_controller.enterTask.text.isNotEmpty){
 _controller.test.add(_controller.enterTask.text);
 _controller.check.add("0");
 _controller.saveList();
                          _controller.enterTask.clear();
                          }
                         
                        
                          Get.back();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Data Saved!')),
                            );
                          },
                          child: Text('Save'),
                        ),
                      ],
                    ),
                  ),
                );
                   },
            );
                },
                
                 child: Container(height: 50,width: 50,decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20) ),
                  
                  child: Icon(Icons.add,size: 30,),),
               ),
             ),
           )
          ]
        )
      ),
    ),
   );
  }
}