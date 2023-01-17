import 'package:asroo/logic/controller/bloc/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/binding/app_binding.dart';

class Test extends StatelessWidget{
   Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit , AuthState>(
      listener:  (context , state ){},
      builder : (context , state )=>  Scaffold(
        body: Center(
          child: InkWell(
            onTap: (){
              print("test");
              AppBinding.getAuth(context).changeVisible();
            },
            child: Container(
              height: 200,
              width: 300,
              // color: AuthInstance.getAuth(context).color,
            ),
          ),
        ),
      ),
    );
  }
}
