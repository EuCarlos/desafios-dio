# O papel dos Bancos de Dados Relacionais (SQL) e Não Relacionais (NoSQL) no contexto de um Engenheiro de Dados
Para o desenvolvimento de todo o contexto aqui vai ser dividido 3 topicos: SQL, NoSQL e Considerações finais.
___
## 1. SQL
Começamos com os bancos de dados SQL, que são do tipo de banco de dados relacional que utilizam linguagem de consulta estruturada e possuem esquema pré-definido, e que são escaláveis verticalmente. Os bancos de dados SQL são baseados em tabelas e são melhores para transações de várias linhas.

Alguns exemplos de SGBD's SQL:
- MySQL
- Postgres
- Oracle
- SQLite

## 2. NoSQL
Agora falando sobre bancos de dados NoSQL, eles são do tipo não relacionais e isso quer dizer que possuem esquemas dinâmicos para dados não estruturados. Diferente dos bancos de dados relacionas os bancos de dados NoSQL são escaláveis horizontalmente.
Nesse tipo de banco de dados são baseado em: armazenamentos de documentos, valores-chave, gráficos ou colunas largas. No NoSQL é melhor para dados não estruturados como documentos ou JSON.

Alguns exemplos de SGBD's NoSQL
- MongoDB
- Cassandra
- Redis

## Considerações finais
Ao contrario do que muito pensam, os SGBD's NoSQL não substitui os bancos relacionais, ele veio para atender o que não era possível fazer num banco relacional, ou seja ele pode sim atender como uma alternativa mas melhor ainda como complemento dos bancos relacionais. Uma das grandes diferenças nos bancos de dados SQL você precisa ter o relacionamento entre várias tabelas para ter a informação, informação esta disposta no modelo entidade e relacionamento. Já no NoSQL é que toda a informação é agrupada e guardada no mesmo registro. Quando escolher um banco de dados NoSQL? Na engenharia de dados acaba tendo diversos formatos de arquivos tanto de origem como de destino, formato de dados que devemos armazenar no ambiente de dados. No caso dos bancos não relacionais permitem o armazenamento das informações não estruturadas e não rígida. Então quando não escolher um banco de dados NoSQL? Não deve usar escolher quando necessidade de um banco que armazena as entidades, necessite criar relacionamentos entre elas, e quando precisa de uma consistência e um esquema bem rigido.

Mas cada caso é um caso diferente, por isso é necessario estudar profundamente a necessidade de sua aplicação para escolher o melhor tipo e SGBD.