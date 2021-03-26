import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [];

  @override

  void initState(){
    super.initState();

    contatos.add(new Contato( nome: "Andressa", telefone: "(16) 98100.9999", tipo: ContatoType.CELULAR));
    contatos.add(new Contato( nome: "Marta", telefone: "(16) 98100.1234", tipo: ContatoType.TRABALHO));
    contatos.add(new Contato( nome: "Maria", telefone: "(16) 98100.6284", tipo: ContatoType.FAVORITO));
    contatos.add(new Contato( nome: "Alaide", telefone: "(16) 3449.1234", tipo: ContatoType.CASA));
    contatos.add(new Contato( nome: "Anderson", telefone: "(16) 98100.5678", tipo: ContatoType.CELULAR));
    contatos.add(new Contato( nome: "Gabriel", telefone: "(16) 99999.6284", tipo: ContatoType.CELULAR));

    contatos.sort((a,b)=>a.nome.compareTo(b.nome));
  }

  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView.separated(
        itemBuilder: (context, index){
          var contato = contatos[index];
        return ListTile(
          leading: CircleAvatar(
            child: ContatoHelper.getIconByContatoType(contato.tipo),
            backgroundColor: Colors.indigo[100],
          ),
           title: Text(contato.nome),
           subtitle: Text(contato.telefone),
           trailing: IconButton(
             icon: Icon(Icons.call),
             onPressed: () => {},
             ),
        );
      }, 
      separatorBuilder: (context, index)=>Divider(), 
      itemCount: contatos.length)

      );

  }
}

class Contato{
  final String nome;
  final String telefone;
  final ContatoType tipo;

  Contato({@required this.nome, @required this.telefone, @required this.tipo});
}

enum ContatoType {CELULAR, TRABALHO, FAVORITO, CASA}

class ContatoHelper{
  // ignore: missing_return
  static Icon getIconByContatoType(ContatoType tipo){
    switch (tipo){
      case ContatoType.CELULAR:
      return Icon(Icons.phone_android, color: Colors.blue[700]);
      
      case ContatoType.TRABALHO:
        return Icon(Icons.work, color: Colors.grey[900]);
        break;
      
      case ContatoType.FAVORITO:
        return Icon(Icons.star, color: Colors.yellow[600]);
        break;
      
      case ContatoType.CASA:
        return Icon(Icons.home, color: Colors.green[700]);
    }
  }
}