import 'package:flutter/material.dart';

class CurrencyConvertorMaterialPage extends StatefulWidget{
  const CurrencyConvertorMaterialPage({super.key});
  // here we can't create an instance because it is a abstract class
  @override
  State<CurrencyConvertorMaterialPage> createState() => _CurrencyConvertorMaterialPage();
}

class _CurrencyConvertorMaterialPage extends State<CurrencyConvertorMaterialPage>{

  double res =0;
  final TextEditingController textEditingController = TextEditingController();

  // avoids memory leak
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        title: const Text('Currency Calculator',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(
                padding:const EdgeInsets.all(20.0),
                child: Text(
                  'INR ${res!=0?res.toStringAsFixed(2):res.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:TextField(
                  controller: textEditingController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true
                  ),
                  style:const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Please enter amount in USD",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    prefixIcon: Icon(Icons.monetization_on),
                    prefixIconColor: Colors.black,
                    filled: true,
                    fillColor: Color.fromARGB(255, 37, 155, 82),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(60)
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3,
                        strokeAlign: BorderSide.strokeAlignOutside
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 6,
                        style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20)
                      )
                    )
                  ),
                ),
              ),
              //button
              Container(height: 10),
              ElevatedButton(
                onPressed:(){
                  setState(() {
                    res = double.parse(textEditingController.text)*81;
                  });
                } ,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  fixedSize: MaterialStatePropertyAll(Size(200, 60)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.money, 
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 8), 
                      Text("Convert",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}
    
