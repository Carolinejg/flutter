import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
main(){
  runApp(new PerguntaApp());
}
//classe privada
class _PerguntaAppState extends State<PerguntaApp>{// o tipo de componente Stateful (PerguntaApp) ligado a esse componente state 
//contém o estado e as funçôes que depende do mesmo 
  var _perguntasSelecionadas=0; 
  final List<Map<String, Object>> _perguntas = const [//É DO TIPO MAP
      {
        'texto':'Qual é a sua cor favorita?',
        'respostas': ['Preto','Vermelho','Verde','Branco'],
        
      },
      {
        'texto':'Qual o seu animal favorito?',
        'respostas': ['Coelho','Cobra','Elefante','Leão'],
      },
      {
        'texto':'Qual o seu instrutor favorito?',
        'respostas': ['Maria','João','Leo','Pedro'],
      },
    ];
    
  void _responder(){// o método responder depende de estado 
    if(temPerguntaSelecionada){
      setState(() {
      _perguntasSelecionadas++;
    });
    }
    
  }
  bool get temPerguntaSelecionada{
    return _perguntasSelecionadas < _perguntas.length;
  }
//a aárvore de componentes também depende do estado
  Widget build(BuildContext context){
    
    List<String> respostas= temPerguntaSelecionada
    ? _perguntas[_perguntasSelecionadas]['respostas'] 
    :null;
 
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? Column(
          children: <Widget>[
            Questao(_perguntas[_perguntasSelecionadas]['texto']),
             ...respostas.map((t)=> Resposta(t,_responder)).toList(),//operador spread, pega todos os elementos da lista resposta e coloca dentro da lista de Column

          ],
        ) 
        : Center(
          child: Text(
            'Parabéns!',
          style: TextStyle(fontSize:28)
        ),
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