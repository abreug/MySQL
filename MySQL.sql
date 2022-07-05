SQL - BANCO DE DADOS

Arquivos > tabelas > registros

Banco de dados -> Base de Dados,Sistema gerenciador, Linguagem de exploração, programas adicionais

Modelo Hierargquico e em Rede -> IBM

Relacional é o que vamos estudar hoje.

sql -> linguagem de consulta

mysql
DDL Definiçõs
DML Manipulação
DQL Solicitações
DCL Controle
DTL Transações -> DICA ->Durabilidade; Isolamento; Consistencia; Atomicidade.

Banco de dados é composto por tabelas que são feitas por registros

Tipos primitivos:
numerico: inteiro -> TinyInt, SmallInt, Int, MediumInt, BigInt
	real -> Decimal, Float, Double, Real
	logico -> bit, boolean
	
data/tempo: Date, DateTime, TimeStamp, Time, Year

literal: caractere -> Char, VarChar 
	texto -> TinyText, Text, MediumText, LongText
	binario -> TinyBlob, Blob, MediumBlob, LongBlob
	coleção -> Enum, Set

espacial: Geometry, Point, Polygon, MultiPolygon

\ CRIANDO O BANCO DE DADOS /

CREATE DATABASE cadastro > criando banco de dados
DEFAULT CHARACTER SET utf8 
DEFAULT COLLATE utf8_general_ci; > DEFININDO PADRÃO LATINO PARA ACEITAR ACENTOS

CREATE TABLE pessoas (      		> CRIANDO AS TABELAS 
id INT NOT NULL AUTO_INCREMENT, 	> CHAVE PARA QUE NÃO HAJA REPETIÇÃO DE DADOS
nome VARCHAR(30) NOT NULL, 			> TIPO VARCHAR QUE VAI ATE 30 CARACTERES E OS QUE NÃO ESTÃO SENDO UTILIZADOS NÃO INFLUENCIAM NA MEMORIA
nascimento DATE, 
sexo ENUM ('M','F'), 				> SÓ ACEITA O QUE JA FOI DEFINIDO
peso DECIMAL (5,2), 
altura DECIMAL (3,2),
nacionalidade VARCHAR (20) DEFAULT 'Brasil', 		> DEFAULT SERVE PARA QUE SE NADA FOI COLOCADO, O PADRÃO SEJA BRASIL
PRIMARY KEY (id) 					> CHAVE PARA QUE NÃO HAJA REPETIÇÃO DE DADOS
) DEFAULT CHARSET = utf8; 			> DEFININDO PADRÃO LATINO COM ACENTOS

\ FORMAS DE INSERIR DADOS NO BANCO \

INSERT INTO pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
(DEFAULT,'Adalgiza', '1930-11-2', 'F', '63.2', '1.75', 'Irlanda');
SELECT * FROM pessoas;

OU
INSERT INTO pessoas VALUES
(DEFAULT,'Adalgiza', '1930-11-2', 'F', '63.2', '1.75', 'Irlanda'),
(DEFAULT,'Madson', '1912-12-2', 'F', '99.2', '1.35', 'Africa Subsariana'),
(DEFAULT, 'Rei Diego', '1924-06-25', 'F', '34', '2.10', 'Inglaterra'),
(DEFAULT, 'Angelo', '1964-07-01', 'F', '24', '1.80', 'Dramalandia');


___________________________________

DESCRIBE pessoas;

ALTER TABLE pessoas
ADD COLUMN profissao VARCHAR(10) AFTER nome;                                     > ADICIONA UMA COLUNA E POSICIONA DEPOIS DE ALGUM COLUNA QUE DEVE SER CITADA

ALTER TABLE pessoas
MODIFY COLUMN profissao VARCHAR(20);       >MODIFICA CARACTERISTICAS DAQUELA COLUNA

ALTER TABLE pessoas 
CHANGE COLUMN profissao prof VARCHAR(20);  >MODIFICA O NOME DAQUELA COLUNA

ALTER TABLE pessoas
ADD codigo INT FIRST;                 >INDICA QUE É PARA SER ADICIONADO NA PRIMEIRA LINHA

ALTER TABLE pessoas
RENAME TO Manitos;                         > ALTERAR O NOME DA TABELA POR COMPLETO

DROP TABLE IF EXISTS nomedatabela; >APAGA A TABELA POR COMPLETO
