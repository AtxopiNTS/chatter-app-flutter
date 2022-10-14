import 'package:flutter/material.dart';

import 'package:chatter_app/widgets/logo.dart';
import 'package:chatter_app/widgets/custom_input.dart';
import '../widgets/boton_azul.dart';
import 'package:chatter_app/widgets/labels.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                Logo( titulo: 'Nueva cuenta'),
                _Form(),
                Labels( route: 'login', question: '¿Ya tienes cuenta?', actionText: 'Ingresas ahora!'),
        
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

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final pass2Ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( top: 40 ),
      padding: EdgeInsets.symmetric( horizontal: 50),
      child: Column(
        children: [
          
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),

          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),

          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            keyboardType: TextInputType.text,
            textController: passCtrl,
            isPassword: true,
          ),

          CustomInput(
            icon: Icons.lock_sharp,
            placeholder: 'Confirmar contraseña',
            keyboardType: TextInputType.text,
            textController: pass2Ctrl,
            isPassword: true,
          ),

          BotonAzul(
            buttonText: 'Registrarse',
            onPressed:  () { 
              print( nameCtrl.text ); 
              print( emailCtrl.text ); 
              print( passCtrl.text );
              print( pass2Ctrl.text ); 
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