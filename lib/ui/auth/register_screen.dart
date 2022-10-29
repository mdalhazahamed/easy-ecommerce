import 'package:eusy/busness_logic/auth.dart';
import 'package:eusy/ui/auth/login-screen.dart';
import 'package:eusy/ui/route/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../const/colors.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_orange,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 150.h,
              width: ScreenUtil().screenWidth,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.light,
                        color: Colors.transparent,
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 22.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Welcome Buddy!",
                            style: TextStyle(
                                fontSize: 22.sp, color: AppColors.deep_orange),
                          ),
                          Text(
                            "Glad to see you back my buddy.",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 48.h,
                                width: 41.w,
                                decoration: BoxDecoration(
                                    color: AppColors.deep_orange,
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Center(
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
                                    size: 20.w,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Please Enter Your Email");
                                    }
                                    // reg expression for email validation
                                    if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return ("Please Enter a valid email");
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _emailController.text = value!;
                                  },
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: "E-mail",
                                    hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xFF414041),
                                    ),
                                    labelText: 'EMAIL',
                                    labelStyle: TextStyle(
                                      fontSize: 15.sp,
                                      color: AppColors.deep_orange,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 48.h,
                                width: 41.w,
                                decoration: BoxDecoration(
                                    color: AppColors.deep_orange,
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Center(
                                  child: Icon(
                                    Icons.lock_outline,
                                    color: Colors.white,
                                    size: 20.w,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    RegExp regex = new RegExp(r'^.{6,}$');
                                    if (value!.isEmpty) {
                                      return ("Password is required for login");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Enter Valid Password(Min. 6 Character)");
                                    }
                                  },
                                  onSaved: (value) {
                                    _passwordController.text = value!;
                                  },
                                  controller: _passwordController,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    hintText: "password must be 6 character",
                                    hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xFF414041),
                                    ),
                                    labelText: 'PASSWORD',
                                    labelStyle: TextStyle(
                                      fontSize: 15.sp,
                                      color: AppColors.deep_orange,
                                    ),
                                    suffixIcon: _obscureText == true
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _obscureText = false;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.remove_red_eye,
                                              size: 20.w,
                                            ))
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _obscureText = true;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.visibility_off,
                                              size: 20.w,
                                            )),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 50.h,
                          ),
                          // elevated button
                          SizedBox(
                            width: 1.sw,
                            height: 56.h,
                            child: ElevatedButton(
                              onPressed: () {
                                _formKey.currentState!.validate();

                                Auth().registration(_emailController.text,
                                    _passwordController.text, context);
                              },
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.sp),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.deep_orange,
                                elevation: 3,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Wrap(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFBBBBBB),
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  " Sign In",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.deep_orange,
                                  ),
                                ),
                                onTap: () {
                                  Get.toNamed(signIn);
                                },
                              )
                            ],
                          )
                        ],
                      ),
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
}
