import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/cubit_register/register_states.dart';

import '../Users Model/user_model.dart';



class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isLock = true;
  IconData suffix = Icons.visibility_outlined;
  void changeLockPassword() {
    isLock = !isLock;
    suffix = isLock ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangeIsPasswordState());
  }

  bool isLock1 = true;
  IconData suffix1 = Icons.visibility_outlined;
  void changeLockConfirmPassword() {
    isLock1 = !isLock1;
    suffix1 =
    isLock1 ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangeIsConfirmPasswordState());
  }





  void userRegister({
    required String name,
    required String email,
    required String date,
    required String password,
    required String status,



  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      userCreate(
        uId: value.user!.uid,
        date: date,
        email: email,
        name: name,
        status: status,

      );
    }).catchError((error) {
      print('Hello Register');
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String date,
    required String uId,
    required String status,


  }) {
    UserModel model = UserModel(
      email: email,
      date: date,
      name: name,
      uId: uId,
      status:status,



    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }
}

