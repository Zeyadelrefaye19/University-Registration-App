
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../Advisor/Advisor.dart';
import '../Professor/Professor.dart';
import '../Registers/register_screen.dart';
import '../Student/Student Home.dart';
import '../cubit _login/cubit.dart';
import '../cubit _login/state.dart';

class LoginScreen extends StatelessWidget

{
  LoginScreen({Key? key,required this.status}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String status;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if(state is LoginSuccessState){

              if(status=='Advisor'){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        AdvisorDashboard()
                    ),
                        (route) => false);
              }
              else if(status=='Student'){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => StudentHomePage()
                    ),
                        (route) => false);
              }
              else if(status=='Professor'){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Proffessor()
                    ),
                        (route) => false);
              }
            }
          },

          builder: (context, state) {
            var cubit = LoginCubit.get(context);
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
                                  'LOGIN',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Welcome Back To Home',
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
                                        label: 'E-mail',
                                        controller: emailController,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your E-mail';
                                          } else {
                                            return null;
                                          }
                                        },
                                        type: TextInputType.emailAddress,
                                        prefix: Icons.person,
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

                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Forget Password ?',
                                      style: TextStyle(
                                          color: Colors.blue[300],
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
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
                                const SizedBox(
                                  height: 20,
                                ),

                                
                                Container(
                                  child: ConditionalBuilder(
                                    condition: true,
                                    builder: (context) => defaultButton(
                                        text: 'Login',
                                        function: () {
                                          if (formKey.currentState!.validate()) {
                                            cubit.userLogin(
                                                email: emailController.text,
                                                password: passwordController.text);
                                          }
                                        }),
                                    fallback: (context) => const Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                ),


                              ],
                            ),

                            Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey[200],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'You Don\'t Have An Account ?',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                TextButton(
                                  onPressed: () {

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) =>RegisterScreen()),
                                            (route) => false);
                                  },
                                  child: Text(
                                    'SignUp Now',
                                    style: TextStyle(
                                        color: Colors.blue[300],
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                ),
              ),

            );
          }),
    );
  }
  void receiveName(String status) {
    this.status = status;
  }
}
Widget defaultTextField({
  required String label,
  required TextEditingController controller,
  required String? Function(String?)? validate,
  String? Function(String?)? onSubmit,
  required TextInputType type,
  required IconData prefix,
  IconData? suffix,
  Function()? funcSuffix,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
            child: Icon(prefix),
          ),
          suffixIcon: IconButton(onPressed: funcSuffix, icon: Icon(suffix)),
          border: OutlineInputBorder()),
    );

Widget defaultButton(
    {required String text,
      required Function()? function,
      Color color = Colors.blue,
      double width = double.infinity,
      double height = 50,
      double radius = 30,
      double fontSize=16}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(color: Colors.white,fontSize: fontSize),
        ),
      ),
    );
