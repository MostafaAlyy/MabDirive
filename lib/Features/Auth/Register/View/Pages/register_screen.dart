import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mab_drive/Core/general_components/custom_form_field.dart';
import 'package:mab_drive/Core/my_validators.dart';
import 'package:mab_drive/Features/Auth/Register/ViewModel/Register%20Cubit/register_cubit.dart';

import '../../../../../Core/general_components/build_show_toast.dart';
import '../../../Login/View/Pages/login_screen.dart';
import '../../../Phone Verification/View/Pages/phone_verification_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const String routeName = "register";
  Country textCountry = Country(
      phoneCode: '20',
      countryCode: 'EG',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'Egypt',
      example: '1001234567',
      displayName: ' Egypt (EG) [+20]',
      displayNameNoCountryCode: '0',
      e164Key: '20-EG-0');

  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RegisterCubit registerCubit = RegisterCubit();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171717),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff171717),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  'Join us via your Email',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const Text(
                  'Please enter your details',
                  style: TextStyle(color: Colors.white60, fontSize: 16),
                ),
                SizedBox(height: 40,),
                CustomFormField(
                    keyboardType: TextInputType.name,
                    hintText: 'Enter Your Name',
                    validator: (value) => MyValidators.nameValidator(value),
                    controller: nameController),
                SizedBox(height: 20,),

                CustomFormField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Enter Your Email',
                    validator: (value) => MyValidators.emailValidator(value),
                    controller: emailController),
                SizedBox(height: 20,),
                CustomFormField(
                    hintText: 'Enter Your password',
                    validator: (value) => MyValidators.passwordValidator(value),
                    controller: passwordController),
                SizedBox(height: 20,),
                CustomFormField(
                    hintText: 'Enter password confirmation',
                    validator: (value) =>
                        MyValidators.repeatPasswordValidator(
                            value: value, password: passwordController.text),
                    controller: rePasswordController),
                SizedBox(height: 40,),



                BlocConsumer<RegisterCubit, RegisterState>(
                  bloc: registerCubit,
                  listener: (context, state) {
                  },
                  builder: (context, state) {
                    if(state is RegisterLoading){
                      return Center(child: CircularProgressIndicator());
                    }
                    else if(state is RegisterError){
                      buildShowToast(state.message);
                    }
                    else if(state is RegisterSuccess){
                      buildShowToast(state.message);
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            register();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Register',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    }
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          register();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            ' Next',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Allready Have an Account ? " ,
                      style: TextStyle(
                        color:Color(0xffEDEDED),
                      ),
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                        },
                        child: Text("Login")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register()async{
    if (formKey.currentState?.validate() == false) {
      return;
    }
    registerCubit.register(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text
    );
  }

  // void showCountry(BuildContext context) {
  //   showCountryPicker(
  //       context: context,
  //       countryListTheme: CountryListThemeData(
  //         flagSize: 25,
  //         backgroundColor: Colors.white,
  //         textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
  //         bottomSheetHeight: 500,
  //         // Optional. Country list modal height
  //         //Optional. Sets the border radius for the bottomsheet.
  //         borderRadius: const BorderRadius.only(
  //           topLeft: Radius.circular(20.0),
  //           topRight: Radius.circular(20.0),
  //         ),
  //         //Optional. Styles the search field.
  //         inputDecoration: InputDecoration(
  //           labelText: 'Search',
  //           hintText: 'Start typing to search',
  //           prefixIcon: const Icon(Icons.search),
  //           border: OutlineInputBorder(
  //             borderSide: BorderSide(
  //               color: const Color(0xFF8C98A8).withOpacity(0.2),
  //             ),
  //           ),
  //         ),
  //       ),
  //       showPhoneCode: true,
  //       onSelect: (Country country) {
  //         setState(() {
  //           textCountry = country;
  //         });
  //       });
  // }

}

