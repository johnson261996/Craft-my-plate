import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colours.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void validate() {
    final FormState isvalid = _formKey.currentState!;
    if (isvalid.validate()) {
      print('Form is valid');
      Navigator.pushNamed(context,"/rootapp");
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
               children: [
              const SizedBox(height: 20),
                 Text(
                   "Just a step away!",
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w700
                   ),
                   textAlign: TextAlign.start,
                 ),
            const SizedBox(height: 10),
             TextFormField (
             validator: (value) {
               if (value!.isEmpty) {
                 return 'Please enter name';
               }
               return null;
             },
            decoration:  InputDecoration(
              hintText: 'Full Name',
              border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: kPrimary,
                  width: 2,
                ),
              ),
              enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: kLightGray,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: kPrimary,
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 13.5,horizontal: 10),
            ),
            controller: _nameController,
            keyboardType: TextInputType.text,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
          ),
            const SizedBox(height: 10),
             TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailcontroller,
              validator: (value) {
                String  pattern =
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?)*$";
                RegExp regex =  RegExp(pattern);
                if (!regex.hasMatch(value!) || value.isEmpty) {
                  return 'Please enter valid email';
                }
                return null;
              },
              decoration: InputDecoration(
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: kPrimary,
                    width: 2,
                  ),
                ),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: kLightGray,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: kPrimary,
                    width: 2,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 13.5,horizontal: 10),
                hintText: "Enter Email ID",
              ),
            ),

                 Expanded(
                   child: Align(
                     alignment: Alignment.bottomCenter,
                     child: GestureDetector(
                       onTap: () => validate(),
                       child: Container(
                         margin: const EdgeInsets.all(8),
                         height: 45,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: kPrimary,
                           borderRadius: BorderRadius.circular(10),
                         ),
                         alignment: Alignment.center,
                         child: const Text(
                           'Let\'s Start',
                           style: TextStyle(color: Colors.white, fontSize: 16.0,fontWeight: FontWeight.bold),
                         ),
                       ),
                     ),
                   ),
                 ),

            ],
          ),
        ),
      ),
    );
  }
}
