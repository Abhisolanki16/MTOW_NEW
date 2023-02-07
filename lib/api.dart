import 'package:flutter/material.dart';

class validation extends StatefulWidget {
  const validation({Key? key}) : super(key: key);

  @override
  State<validation> createState() => _validationState();
}

class _validationState extends State<validation> {

  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("app")),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
              children : [  
                TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "required";
                            }else{
                              return null ;
                            }
                          },
                          controller: first,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person,size: 30,),
                              border: OutlineInputBorder(),
                              labelText: 'Unique ID',
                              //hintText: 'Enter valid email id as abc@gmail.com'
                              ),
              ),
              TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "required";
                            }else{
                              return null ;
                            }
                          },
                          controller: second,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person,size: 30,),
                              border: OutlineInputBorder(),
                              labelText: 'Unique ID',
                              //hintText: 'Enter valid email id as abc@gmail.com'
                              ),
              ),
        
              ElevatedButton(
                onPressed: (){
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    print("submitted");
                  }
                },
                child: Text("submit")),
            ],
          ),
        ),
      ),
    );
  }
}