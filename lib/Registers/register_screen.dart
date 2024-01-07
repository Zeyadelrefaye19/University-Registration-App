import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Login/Login_Screen.dart';
import '../cubit_register/register_cubit.dart';
import '../cubit_register/register_states.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String status;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
            listener: (context, state) {
              if(state is CreateUserSuccessState){
                if(status=='Advisor'){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          LoginScreen(status: 'Advisor',)
                      ),
                          (route) => false);
                }
                else if(status=='Student'){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen(status: 'Student',)
                      ),
                          (route) => false);
                }
                else if(status=='Professor'){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen(status: 'Professor',)
                      ),
                          (route) => false);
                }
              }
            },
            builder: (context, state) {
              var cubit = RegisterCubit.get(context);
              return Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  'REGISTER',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Welcome',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      defaultTextField(
                                        label: 'UserName',
                                        controller: usernameController,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your UserName';
                                          } else {
                                            return null;
                                          }
                                        },
                                        type: TextInputType.text,
                                        prefix: Icons.person,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextField(
                                        label: 'E-Mail',
                                        controller: emailController,
                                        type: TextInputType.emailAddress,
                                        prefix: Icons.email_outlined,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your Email';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextField(
                                        label: 'DD-MM-YYYY',
                                        controller: birthdayController,
                                        type: TextInputType.text,
                                        prefix: Icons.cake,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'DD-MM-YYYY';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextField(
                                          label: 'Password',
                                          controller: passwordController,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter your password';
                                            } else {
                                              return null;
                                            }
                                          },
                                          type: TextInputType.visiblePassword,
                                          prefix: Icons.lock,
                                          suffix: cubit.suffix,
                                          funcSuffix: () {
                                            cubit.changeLockPassword();
                                          },
                                          isPassword: cubit.isLock),

                                      const SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButton(
                                          items: <DropdownMenuItem>[
                                            DropdownMenuItem(
                                              child: Text('Student'),
                                              value: 'Student',
                                            ),
                                            DropdownMenuItem(
                                              child: Text('Professor'),
                                              value: 'Professor',
                                            ),
                                            DropdownMenuItem(
                                              child: Text('Advisor'),
                                              value: 'Advisor',
                                            ),
                                          ],
                                          onChanged: (value) {
                                            if (value == 'Student') {
                                              status= 'Student';
                                            }
                                            else if (value == 'Advisor') {
                                              status= 'Advisor';
                                            }
                                            else if (value == 'Professor') {
                                              status= 'Professor';
                                            }
                                          }),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Already Have an Account ?',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                                MaterialPageRoute(builder: (context) =>LoginScreen(
                                                status:'Student'
                                            )
                                                ),
                                        );
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>LoginScreen(
                                        status:'Advisor'
                                        )
                                        ),
                                        );
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>LoginScreen(
                                        status:'Professor'
                                        )
                                        ),
                                        );

                                      },

                                      child: Text(
                                        'Sign In Now',
                                        style: TextStyle(
                                            color: Colors.blue[300],
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ConditionalBuilder(
                                  condition: state is! RegisterLoadingState,
                                  builder: (context) => defaultButton(
                                      text: 'Register Now',
                                      function: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.userRegister(
                                              name: usernameController.text,
                                              email: emailController.text,
                                              date: birthdayController.text,
                                              password: passwordController.text,
                                              status: status
                                          );
                                        }
                                      }
                                  ),
                                  fallback: (context) => const Center(
                                      child: CircularProgressIndicator()),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}