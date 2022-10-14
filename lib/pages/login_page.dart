import 'package:flutter/material.dart';

import 'package:chatter_app/widgets/logo.dart';
import 'package:chatter_app/widgets/custom_input.dart';
import '../widgets/boton_azul.dart';
import 'package:chatter_app/widgets/labels.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo( titulo: 'Chatter App'),
                _Form(),
                Labels( route: 'register', question: '¿No tienes cuenta?', actionText: 'Crea una ahora!' ),
        
                _Terms(),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( top: 40 ),
      padding: EdgeInsets.symmetric( horizontal: 50),
      child: Column(
        children: [
          
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),

          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            keyboardType: TextInputType.emailAddress,
            textController: passCtrl,
            isPassword: true,
          ),

          BotonAzul(
            buttonText: 'Login',
            onPressed:  () { 
              print( emailCtrl.text ); 
              print( passCtrl.text ); 
            },
         ),
          

        ],
      ),
    );
  }
}



class _Terms extends StatelessWidget {
  const _Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Términos y condiciones de uso', style: TextStyle( fontWeight: FontWeight.w200 ) ,)
    );
  }
}