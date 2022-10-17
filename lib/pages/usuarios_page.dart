import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chatter_app/models/usuario.dart';
class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(uid: '1', nombre: 'Antonio', email: 'test1@test.com', online: true),
    Usuario(uid: '2', nombre: 'Maria', email: 'test2@test.com', online: true),
    Usuario(uid: '3', nombre: 'Fernando', email: 'test3@test.com', online: false),
    Usuario(uid: '4', nombre: 'Pepe', email: 'test4@test.com', online: true),
  ];

   _cargarUsuarios() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Mi nombre', style: TextStyle( color: Colors.black87 ),  )
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {}, 
          icon: Icon( Icons.exit_to_app, color: Colors.black87 ),
          ),        
        actions: [
          Container(
            margin: EdgeInsets.only( right: 10),
            child: Icon( Icons.check_circle, color: Colors.green[400] ),
            // child: Icon( Icons.offline_bolt, color: Colors.red ),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        header: WaterDropHeader(
          complete: Icon( Icons.check, color: Colors.blue[400] ),
          waterDropColor: Colors.blue,
        ),
        child: _listViewUsuarios(),
      )
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i ) => _usuarioListTile( usuarios[i] ),
      separatorBuilder: (_, i) => Divider(),
      itemCount: usuarios.length
    );
  }

  ListTile _usuarioListTile( Usuario usuario) {
    return ListTile(
          title: GestureDetector(
              onTap:() => Navigator.pushNamed(context, 'chat'),
              child: Text( usuario.nombre ),
          ),
          subtitle: Text( usuario.email ),
          leading: CircleAvatar(
            child: Text( usuario.nombre.substring(0,2)),
            backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.7),
          ),
          trailing: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: usuario.online ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(100)
            ),
          ),
        );
  }
  


}