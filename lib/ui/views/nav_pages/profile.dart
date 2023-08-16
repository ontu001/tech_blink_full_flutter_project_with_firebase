import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blink/model/user_profile.dart';
import 'package:tech_blink/services/firesotre_db.dart';
import 'package:tech_blink/ui/widgtes/custom_button.dart';
import 'package:tech_blink/ui/widgtes/custom_text_field.dart';

class Profile extends StatelessWidget{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _uidController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreDB().getUserProfile(),
        builder: (_, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            if (snapshot.hasData){
              UserProfile userProfile = snapshot.data as UserProfile;
              _nameController.text = userProfile.name;
              _emailController.text =userProfile.email;
              _uidController.text = userProfile.uid;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,

                child: Padding(
                  padding: EdgeInsets.only(top: 100,left: 20,right: 20),
                  child: Column(
                    children: [
                      customFormField(TextInputType.text, _nameController, context, 'user name', (val){},prefixIcon: Icons.person_outlined),
                      customFormField(TextInputType.emailAddress, _emailController, context, 'user name', (val){}, prefixIcon: Icons.email_outlined,readOnly: true), //read only for stop the edit option
                      customFormField(TextInputType.text, _uidController, context, 'user name', (val){},prefixIcon: Icons.verified_outlined,readOnly: true),
                      SizedBox(height: 10,),
                      customButton('Update', () async {
                        final updateData = UserProfile(name: _nameController.text.trim(), email: _emailController.text.trim(), uid: _uidController.text.trim());
                        await FirestoreDB().userProfileUpdate(updateData);
                      })
                    ],
                  ),
                ),
              );




            }
            else{
              return Center(
                child: Text('Something went wrong',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              );
            }
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }


}