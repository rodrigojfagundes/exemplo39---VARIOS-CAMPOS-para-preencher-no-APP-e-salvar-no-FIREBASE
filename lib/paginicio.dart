import 'package:exemplo39/firebase.dart';
import 'package:flutter/material.dart';

class inicio extends StatefulWidget {
  //const inicio({ Key? key }) : super(key: key);

  @override
  _inicioState createState() => _inicioState();
}

class _inicioState extends State<inicio> {
//declarando as variaveis q IRAO receber o valor q sera
//digitado pelo usuario, eles sao so tipo TextEditingControler,
//pois o valor q vamos receber é textual
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();
  TextEditingController empresa = TextEditingController();
  TextEditingController cidade = TextEditingController();
  TextEditingController estado = TextEditingController();
  TextEditingController pais = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //carregando o esqueleto do app
    return Scaffold(
      //ACHO Q ele ta dizendo q se tiver MUITOS CAMPOS/CONTAINERS, ETC...
      //automaticamente vamos poder rolar a pagina para baixo com um SCROLL
      //ou seja passar o dedo para rolar o conteudo da tela
      body: SingleChildScrollView(
        //dentro dele vamos chamar um FORM q EU ACHO q é um formulario
        child: Form(
          //criando uma coluna para podemos colocar os campos q iremos digitar
          //os valores um em baixo do outro...
          child: Column(
            //a column recebe uma LISTA/VETOR de CHILDS... Ou seja recebe
            //varios CHILDS
            children: [
              //o nosso primeiro CHILD sera um TextFormField...
              //ou seja um CAMPO para preencher um FORMULARIO TEXTUAL
              TextFormField(
                //informando q o texto q vamos receber é to tipo textual
                keyboardType: TextInputType.text,
                //mensagem q ira ficar em cima do campo q iremos add o texto
                decoration: InputDecoration(labelText: "insira o seu nome"),
                //texto digitado por nos ficara centralizado
                textAlign: TextAlign.center,
                //o valor sera armazenado na variavel NOME
                controller: nome,
              ),
              //criando um TEXTFORMFIELD que é um campo para digitar um texto
              TextFormField(
                //o tipo de valor q sera digitado é do tipo TEXTUAL
                //entao o teclado aparece todas letras e numeros...
                keyboardType: TextInputType.text,
                //decoration nos podemos fazer algumas DECORACOES
                //no caso vamos criar um texto em cima e escrever INSIRA A SUA IDADE
                decoration: InputDecoration(labelText: "insira a sua idade"),
                //os valores digitados ficaram centralizados
                textAlign: TextAlign.center,
                //os valores digitados neste campo vao para a variavel IDADEs
                controller: idade,
              ),
              //criando campo para digitar um TEXTO
              TextFormField(
                //texto sera digitado no formato de TEXT ou seja TEXTO
                keyboardType: TextInputType.text,
                //decorando e colocando a frase INSIRA A SUA EMPRESA
                //em cima do campo q iremos digitar
                decoration: InputDecoration(labelText: "insira a sua empresa"),
                //o texto digitado no campo ficara centralizado
                textAlign: TextAlign.center,
                //os valores digitados no campo acima ficaram armazenados na variavel
                //empresa
                controller: empresa,
              ),
              //criando campo para digitarmos um texto
              TextFormField(
                //os valores serao do tipo textual... EU ACHO Q por isso pode ser
                //colocado tanto letras, numeros, etc...
                keyboardType: TextInputType.text,
                //decorando... colocando o texto INSIRA A SUA CIDADE em CIMA
                //do campo q iremos digitar o nome da cidade
                decoration: InputDecoration(labelText: "insira a sua cidade"),
                //valores digitados ficarao no centro do app
                textAlign: TextAlign.center,
                //valores digitados ficaram salvos na variavel CIDADE...
                //variavel esta q assim como as outras, nos criemos ali em cima
                controller: cidade,
              ),
              //campo para digitar o texto
              TextFormField(
                //inserindo o valor textual
                keyboardType: TextInputType.text,
                //ADD a frase INSIRA O SEU ESTADO em cima do campo q vamos
                //preencher
                decoration: InputDecoration(labelText: "insira o seu estado"),
                //o texto digitado ficara centralizado
                textAlign: TextAlign.center,
                //os valores digitados ficaram armazenados na variavel estado
                controller: estado,
              ),
              //campo para digitar texto
              TextFormField(
                //dizendo q vai ser do tipo textual os valores q serao digitados
                keyboardType: TextInputType.text,
                //em cima do campo q iremos digitar vai aparecer uma frase escrita
                //insira o seu pais
                decoration: InputDecoration(labelText: "insira o seu pais"),
                //texto digitado por nos ficara no CENTRO do APP
                textAlign: TextAlign.center,
                //os valores digitados ficaram salvos na variavel PAIS
                controller: pais,
              ),
              //campo para detectar TOQUE/CLIQUE na TELA
              GestureDetector(
                //se for dado UM TOQUE/CLIQUE
                onTap: () {
                  //chamando a CLASSE FB(FireBase) e passando para ela o valor
                  //q ta preenchido nas variaveis NOME, IDADE, EMPRESA, CIDADE
                  //ESTADO, PAIS... e essas variaveis tem os valores q digitamos
                  //acima
                  fb(nome.text, idade.text, empresa.text, cidade.text,
                          estado.text, pais.text)
                      //e dentro da CLASSE FB tem a FUNCAO ADDCADASTRO
                      //funcao q e responsavel por pegar o valor das variaveis
                      //NOME, IDADE, EMPRESA, CIDADE, ESTADO, PAIS... E
                      //add esses valores ao FIREBASE
                      .addCadastro(nome.text, idade.text, empresa.text,
                          cidade.text, estado.text, pais.text);
                },
                //o GESTURE DETECTOR acima só ira funcionar quando CLICARMOS
                //no container a baixo...
                child: Container(
                  //parametros do container...
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  //texto do container...
                  child: Text('cadastrar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
