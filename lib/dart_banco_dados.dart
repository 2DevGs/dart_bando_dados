import 'package:mysql1/mysql1.dart';
import 'database.dart';

Future<void> main() async {

  final database = Database();
  var mysqlConnection = await database.openConnection();

  var resultado = await mysqlConnection.query(
    'insert into aluno(id, nome) values(?,?)',
    [
    null,
    'Gustavo Dias',
    ]
  );

  print(resultado.affectedRows);

  var resultadoSelect = await mysqlConnection.query('select * from aluno');
  resultadoSelect.forEach((row) {
    print('Resultado por indice:');
    print(row[0]);
    print(row[1]);

    print('Resultado pelo nome da coluna:');
    print(row['id']);
    print(row['nome']);
  });

  var resultadoUpdate = await mysqlConnection.query('update aluno set nome =? where id =?', ['Academia do flutter', 1]);

  var resultadoSelectUnico = await mysqlConnection.query('select * from aluno where id =?', [1]);
  print('Parametro Unico:');

  if(resultadoSelectUnico.isNotEmpty) {
  var rowUnico = resultadoSelectUnico.first;
    print('Resultado por indice:');
    print(rowUnico[0]);
    print(rowUnico[1]);

    print('Resultado pelo nome da coluna:');
    print(rowUnico['id']);
    print(rowUnico['nome']);
  }

  try{
    await mysqlConnection.query('update aluno set nome =? where id =?', [1, 'Academia do flutter']);
  }on MySqlException catch(e,s) {
    print(e);
    print('Erro ao atualizar dados do aluno');
  }
  
  await mysqlConnection.transaction((conn)  {
    // tira da conta 200 reais
    // maquina envia dinheiro para o usuario
    
  });

}
