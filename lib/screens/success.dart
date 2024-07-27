import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/categories.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
        title: const Text(
          "VogueVault",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.yellow[700],
        leading: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
          size: 32,
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(flex: 2,),
              Icon(Icons.check_circle_outline,size: 64,color: Colors.teal[700],),
              SizedBox(width: 32,),
              Text('Succesful!',
                        textAlign: TextAlign.center,
              
                style: TextStyle(
              
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            Text('You have successfully registered in our app! Now u can start shopping',
            textAlign: TextAlign.center,
                style:
                 TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                )),
                Spacer(flex: 2,),
                                    ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Categories(),
                  ),
                );
              },
              child: const Text(
                'Start shopping',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(320, 60),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Spacer(flex: 1,)
                      
          
          ],),
        ),
    );
    
  }
}