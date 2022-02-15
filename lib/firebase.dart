import 'package:cloud_firestore/cloud_firestore.dart';

//classe FB... classe q recebe o valor das variaveis NOME, IDADE, EMPRESA, CIDADE
//ESTADO, PAIS... valores esses q veem da classe INICIO
class fb {
//VARIAVEIS q a classe FB irá receber...
  final String nome;
  final String idade;
  final String empresa;
  final String cidade;
  final String estado;
  final String pais;

//associando o valor das VARIAVEIS ACIMA a CLASSE FB
  fb(this.nome, this.idade, this.empresa, this.cidade, this.estado, this.pais);

//assim chamarmos a classe FB...
//vamos fazer uma COLLECTION REFERENCE... desta forma sempre q quisermos chamar o
//FIREBASE nos vamos apenas digitar CADASTRO, pois CADASTRO será o nome dado
//a REFERENCIA a CONEXAO com o FB...
  CollectionReference cadastro =
      //TBM criamos uma COLECAO com o nome de CADASTRO
      FirebaseFirestore.instance.collection('cadastro');

//criando a funcao FUTURA (pois demora um pouquinho ate os dados irem no FIREBASE)
//por isso a funcao tem q ser do tipo FUTURE... e o nome da funcao é
//ADDCADASTRO... Essa funcao irá receber os DADOS/VARIAVEIS q foram
//passados para a CLASSE FB...
  Future<void> addCadastro(String nome, String idade, String empresa,
      String cidade, String estado, String pais)
  //os dados sao add de forma ASSINCRONA... ou seja enquanto o APP
  //ta enviando os dados para o FB, ele pode ao mesmo tempo ta carregando
  //outras coisas...
  async {
    //chamando a COLLECTION REFERENCE q fizemos ali em CIMA chamada CADASTRO...
    //COLLECTION REFERENCE essa q faz a conexao com o FB
    return await cadastro
        //criando um DICIONARIO (EU ACHO q e esse o nome)...
        //e no lado ESQUERDO o nome q vai APARECER com "CHAVE" no FB
        //e do lado DIREITO o VALOR q vai aparecer associado a cada CHAVE no FB
        .add({
          'nome': nome,
          'idade': idade,
          'empresa': empresa,
          'cidade': cidade,
          'estado': estado,
          'pais': pais,
        })
        //mensagem caso o retorno seja ok
        .then((value) => print("cadastro ok"))
        //mensagem caso de problema
        .catchError((error) => print("falha cadastro $error"));
  }
}
