



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/Bappy.jpg'),
            ),
            const SizedBox(height: 10),
            itemProfile('Name', 'Bappy Deb Nath', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', 'o1797127296', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('Address', 'mohamadpur, Dhaka', CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile('Email', 'bappydebath2001@gmail.com@gmail.com', CupertinoIcons.mail),
            const SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                //

                //
                  onPressed:  ()  => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>const EditProfile(),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Edit Profile')
              ),
            ),
            const SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "/login");
              },
              child: Container(
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(child:
                  Text("Sign Out",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
               ),
              ),

            ),
          ],
        ),
      ),

    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}



