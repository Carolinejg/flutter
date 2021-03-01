import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(new PerguntaApp());
}
//classe privada
class _PerguntaAppState extends State<PerguntaApp>{// o tipo de componente Stateful (PerguntaApp) ligado a esse componente state 
//contém o estado e as funçôes que depende do mesmo 
  var _perguntasSelecionadas=0; 
    
  void _responder(){// o método responder depende de estado 
    setState(() {
      _perguntasSelecionadas++;
    });
    
    print(_perguntasSelecionadas);
  }
//a aárvore de componentes também depende do estado
  Widget build(BuildContext context){
    final List<String> perguntas = [
      'Qual é a sua cor favorita?',
      'Qual o seu animal favorito?'
    ];
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[_perguntasSelecionadas]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: _responder, //passar um refencia para uma função ja criada
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: _responder,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: _responder,
            ),
            
            
          ],
        ),
      ),

    );
  }
}
class PerguntaApp extends StatefulWidget{//componente que está na árvore de componentes 
  
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
  
  
}