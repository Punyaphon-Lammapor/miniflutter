import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:miniproject/common.dart';
import 'package:miniproject/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
FocusNode focusnodeUsername = FocusNode();
TextEditingController usernameControl =TextEditingController();
FocusNode focusnodePassword = FocusNode();
TextEditingController passwordControl =TextEditingController();
bool hidePassword = false;
SharedPreferences? pref;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1, 0),
              end: Alignment(0, 1),
              colors: [Colors.pink,Colors.lightBlue],
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text("ชื่อ",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  ),
                  ),
              ),
              Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                child:TextFormField(
                  focusNode: focusnodeUsername,
                  controller: usernameControl,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person),
                    hintText: "ชื่อ",
                  ),
                  onFieldSubmitted: (value){
                    focusnodeUsername.unfocus();
                    focusnodeUsername.requestFocus();
                    setState(() {
                      
                    });
                  },
                ),),
              const Align(
                alignment: Alignment.topLeft,
                child: Text("รหัสผ่าน",
                style: TextStyle(
                  fontSize: 22,
                  color:Colors.white,
                  ),
                  ),
              ),
              Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                child:TextFormField(
                  obscureText: hidePassword, 
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: focusnodePassword,
                  controller: passwordControl,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.key),
                    hintText: "รหัสผ่าน",
                    suffixIcon: IconButton(
                      onPressed: () {
                        hidePassword = !hidePassword;
                        setState(() { });
                      }, 
                    icon: const Icon(Icons.remove_red_eye))
                  ),
                  onFieldSubmitted: (value){
                    focusnodePassword.unfocus();
                    focusnodePassword.requestFocus();
                    setState(() {}
                    );
                  },
                ),
                ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height *0.08,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => const Color(0xff003CAE),
                    
                    )
                  ),
                  onPressed: () async{
                    
                    if(usernameControl.text != "" && passwordControl.text != ""){
                      
                    }
                    pref = await SharedPreferences.getInstance();
                    pref!.setString("username",usernameControl.text);
                    pref!.setString("password",passwordControl.text);
                    usernameGB = usernameControl.text;
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()
                    )
                    );
                  },
                  child: const Text("เข้าสู่ระบบ",style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Text("OR",style: TextStyle(color:Colors.white),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Logo(Logos.google),
                  const SizedBox(
                    width: 20,
                  ),
                  Logo(Logos.facebook_f),
                  const SizedBox(
                    width: 20,
                  ),
                  Logo(Logos.twitter),
                  const SizedBox(
                    width: 20,
                  ),
                  Logo(Logos.app_store),
                  const SizedBox(
                    width: 20,
                  ),
                  Logo(Logos.line)
                ],
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}