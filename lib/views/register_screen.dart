import 'package:flutter/material.dart';
import 'package:mizan_app/database/cache_helper.dart';
import 'package:mizan_app/widgets/button_style.dart';

import '../constants.dart';
import 'home_view.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "register";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController country=TextEditingController();

  bool obSecure = true;
  GlobalKey<FormState> key = GlobalKey();
  Color emailBorderColor = Colors.red.shade300;
  String? value;

  static final RegExp nameRegExp = RegExp('[a-zA-Z]');

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty || !regex.hasMatch(value)
        ? 'This field is required'
        : null;
  }

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: key,
              child: Column(
                children: [
                  SizedBox(
                    height: mediaquery.height * .1,
                  ),

                  Image.asset(
                    "assets/images/login.gif",
                    height: mediaquery.height * .25,
                  ),

                  SizedBox(
                    height: mediaquery.height * .05,
                  ),

                  //name textfield
                  TextFormField(
                      controller: nameController,
                      enabled: true,
                      textCapitalization: TextCapitalization.words,
                      maxLength: 32,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.start,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      decoration: const InputDecoration(
                        // prefixIcon: Icon(Icons.person),
                        isDense: true,
                        labelText: "الاسم",
                        counterText: "",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),

                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) => value!.isEmpty
                          ? 'The field is required'
                          : (nameRegExp.hasMatch(value)
                              ? null
                              : 'The field is required')),

                  //E-mail textfield
                  SizedBox(
                    height: mediaquery.height * .03,
                  ),
                  TextFormField(
                    controller: emailController,
                    enabled: true,
                    textCapitalization: TextCapitalization.words,
                    maxLength: 32,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    decoration: const InputDecoration(
                      // prefixIcon: Icon(Icons.person),
                      isDense: true,
                      labelText: "الايميل",
                      counterText: "",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),

                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    validator: validateEmail,
                    onChanged: (value) {
                      setState(() {
                        if (validateEmail(value) == null) {
                          emailBorderColor = Colors.red;
                        } else {
                          emailBorderColor = Colors.grey.shade300;
                          return null;
                        }
                      });
                    },
                  ),

                  //salary textfield
                  SizedBox(
                    height: mediaquery.height * .03,
                  ),
                  TextFormField(
                    controller: salaryController,
                    enabled: true,
                    obscureText: obSecure,
                    textCapitalization: TextCapitalization.words,
                    maxLength: 32,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obSecure = !obSecure;
                          });
                        },
                        icon: obSecure
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.visibility_off),
                      ),
                      isDense: true,
                      labelText: "الراتب الشهري",
                      counterText: "",
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The field is required';
                      }
                      return null;
                    },
                  ),

                  //bank password textfield
                  SizedBox(
                    height: mediaquery.height * .03,
                  ),
                  TextFormField(
                    controller: bankController,
                    enabled: true,
                    obscureText: obSecure,
                    textCapitalization: TextCapitalization.words,
                    maxLength: 32,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obSecure = !obSecure;
                          });
                        },
                        icon: obSecure
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.visibility_off),
                      ),
                      isDense: true,
                      labelText: "الراتب الشهري",
                      counterText: "",
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The field is required';
                      }
                      return null;
                    },
                  ),

                  SizedBox(
                    height: mediaquery.height * .03,
                  ),


                  Container(
                    width: mediaquery.width,
                   // margin: EdgeInsets.all(16),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 1),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text("اختر بلدك",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                        isExpanded: true,
                        value: value,
                          iconSize: 36,
                          icon: Icon(Icons.arrow_drop_down,color:  Color(0xFF708871),),
                          items:items1.map(buildMenuItem).toList(),
                          onChanged: (value)=>setState(() => this.value=value),
                        onTap: () {
                          country;
                        },
                      ),
                    ),
                  ),

                  //signup button
                  SizedBox(
                    height: mediaquery.height * .05,
                  ),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        CacheHelper.saveData(
                            key: "name", value: nameController.text);
                        CacheHelper.saveData(
                            key: "salary", value: salaryController.text);
                        CacheHelper.saveData(
                            key: 'value', value: bankController.text);
                        CacheHelper.saveData(
                          key: 'email',value: emailController.text);
                        CacheHelper.saveData(key: "country", value: country.text);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeView(),
                            ));
                      }
                      return null;
                    },
                    child: Text(
                      "تسجيل",
                      style: TextStyle(
                          fontSize: mediaquery.height * .034,
                          color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    
  }
  DropdownMenuItem<String>buildMenuItem(String item)=>DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
    ),);

}
