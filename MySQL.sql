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

___________________________________

INSERT INTO cursos VALUES
('1','HTML4','Curso de HTML5','40','37','2014'),
('2','Algoritmos','Lógica de Programação','20','15','2014'),
('3','Photoshop','Dicas de Photoshop CC','10','8','2014'),
('4','PGP','Curso de PHP para iniciantes', '40','20','2010'),
('5','Jarva','Introdução à Linguagem Java','10','29','2000'),
('6','MySQL','Bancos de Dados MySQL','30','15','2016'),
('7','Word','Curso completo de Word','40','30','2016'),
('8','Sapateado','Danças Ritmicas','40','30','2018'),
('9','Cozinha Arabe','Aprenda a fazer Kibe','40','30','2018'),
('10','Youtuber','Gerar polêmicas e ganhar inscritos','5','2','2018');

SELECT * FROM cursos;

UPDATE cursos              > ALTERANDO LINHAS
SET nome = 'HTML5'
WHERE idcurso = '1';

SELECT * FROM cursos;

UPDATE cursos               > ALTERANDO 2 INFORMAÇÕES DA LINHA
SET nome = 'PHP', ano = '2015'
WHERE idcurso ='4';

SELECT * FROM cursos;

UPDATE cursos               > ALTERANDO 3 INFORMAÇÕES DA LINHA E LIMITANDO A SÓ UMA LINHA, PARA QUE NÃO HAJA ERROS
SET nome = 'Java', carga = '40' , ano = '2015'
WHERE idcurso = '5'
LIMIT 1;

SELECT * FROM cursos;

UPDATE cursos               > ALTERANDO COLUNAS
SET ano ='2050', carga = '300'
WHERE ano = '2018';

SELECT * FROM cursos;

DELETE FROM cursos			> DELETANDO ATRAVES DE UM PARAMETRO E LIMITANDO							
WHERE ano = '2018'
LIMIT 3;

SELECT * FROM cursos;

TRUNCATE cursos;            > DELETA TODOS OS REGISTROS DA TABELA

SELECT * FROM cursos;

__________________________________

DROP DATABASE cadastro;
DROP DATABASE SYS;

DUMP -> Arquivo de BACKUP DO SEU BANCO

TOOLS -> DATA EXPORT -> VAI GERAR SEU ARQUIVO DE BACKUP

JÁ COM O ARQUIVO DE BACKUP
TOOLS -> DATA IMPORT -> VAI GERAR O BANCO DE DADOS SALVO NO SEU DUMP

USE cadastro;
DESC cursos;
DESC manitos;
SELECT * FROM cursos;
SELECT * FROM manitos;

________________________________________________


CREATE TABLE CLIENTES
( ID INT PRIMARY KEY AUTO_INCREMET,
NOME VARCHAR(50) NOT NULL,                    > VARCHAR ELE DEIXA LIBERADO 50 ESPAÇOS, MAS SÓ IRÁ USAR OS QUE FORAM UTILIZADOS PARA ECONOMIZAR MEMORIA
CPF CHAR(11),                                 > CHAR É UTILIZADO COMO UMA FORMA DE OTMIZAÇÃO, COM DADOS QUE SEMPRE TERÃO AQUELE ESPAÇO
DATANASCIMENTO DATE NOT NULL,
EMAIL VARCHAR(70) NOT NULL
ATIVO BIT NOT NULL                            > BIT OPERADOR LOGICO DE TRUE(1) OU FALSE(0)
)

INSERT INTO CLIENTES (NOME,CPF,DATANASCIMENTO,EMAIL,ATIVO) VALUES ('Marcelo Brito','90090090099','1987-10-10','marcelo.brito@gmail.com',true)

_____________________________________
RELAÇÃO ENTRE DUAS TABELAS

CREATE TABLE CATEGORIAS
(
  ID INT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(50) NOT NULL,
)


CREATE TABLE PRODUTOS
(ID INT PRIMARY KEY AUTO_INCREMENT,
DESCRICAO VARCHAR(100) NOT NULL,
QTESTOQUE FLOAT NOT NULL,
PRECO FLOAT NOT NULL,
CATEGORIAID INT NOT NULL
FOREIGN KEY (CATEGORIAID) REFERENCES CATEGORIAS (ID)      >AQUI VAI SER O ELO DE LIGAÇÃO ENTRE AS TABELAS
)

INSERT INTO CATEGORIAS (NOME) VALUES ('FRIOS')                                                           >inserindo uma linha na tabela categoria que é gerado um id automatico que identifica aquela linha, como unica
INSERT INTO PRODUTOS (DESCRICAO,PRECO,QTESTOQUE,CATEGORIAID) VALUES ('Queijo Marcelo', 99, 99999,1)      >inserindo um produto na categoria anteriormente identificada, ligando assim as duas tabelas        obs: caso seja colocado um 2, no ultimo item dos valor, será retornado um erro onde, não se pode acrescentar um linha em um identificador que não existe na tabela

__________________________
tabela associativa

CREATE TABLE VENDAS
(ID INT PRIMARY KEY AUTO_INCREMENT,
DATAVENDA DATE NOTNULL,
CLIENTEID INT NOT NULL,
TOTALVENDA FLOAT NOT NULL,
FOREIGN KEY (CLIENTEID) REFERENCES CLIENTES (ID)         > A CHAVE ESTRANGEIRA ESTA CONVERSANDO COM A CHAVE PRIMARIA ID DA TABELA CLIENTE
)

CREATE TABLE ITENS_VENDAS
(IDPRODUTO INT NOT NULL
IDVENDA INT NOT NULL,
VALORPRODUTO FLOAT NOT NULL,
DESCONTO FLOAT NOT NULL,
FOREIGN KEY (IDPRODUTOS) REFERENCES PRODUTOS (ID),
FOREIGN KEY (IDVENDA) REFERENCES VENDAS (ID),

PRIMARY KEY (IDPRODUTO,IDVENDA)                          >CHAVE PRIMARIA COMPOSTA, POIS DESSA VEZ OS ID'S PODEM SE REPETIR, POIS SE FOSSE SOMENTE PRIMARY KEY, SÓ IRIA PODER TER UMA VENDA E UM UNICO PRODUTO, POIS A FUNÇÃO DELA É QUE NÃO SE REPITA E CHAVE COMPOSTA, PERMITE QUE HÁ REPETIÇÃO, MAS MANTENHA O CONTROLE

)

INSERT INTO PRODUTOS (CATEGORIAID, DESCRICAO,PRECO,QTESTOQUE) VALUES (1,'Presunto Rei',9,1000)         >inserindo um produto
 INSERT INTO VENDAS (CLIENTEID,DATAVENDA,TOTALVENDA) VALUES (1, '2018-09-09',100)
  INSERT INTO ITENS_VENDAS(IDPRODUTO,VALORPRODUTO,DESCONTO) VALUES (1,1,5,10)
   INSERT INTO ITENS_VENDAS(IDPRODUTO,VALORPRODUTO,DESCONTO) VALUES (1,3,10,0)

VERIFICAR ITENS DENTRO DA TABELA ITENS_VENDAS

______________________________________
PESQUISA NO BANCO

SELECT ID,PRECOS,DESCRICAO FROM PRODUTOS
SELECT * FROM PRODUTOS                          >PODE ESCOLHER AS COLUNAS QUE QUER VER E PODE VER TODAS ATRAVES DO (*)
SELECT P.ID, P.DESCRICAO, P.PRECO, P.QTESTOQUE, C.NOME 'Categoria' FROM PRODUTOS P INNER JOIN CATEGORIAS C ON C.ID = P.CATEGORIAID      >INNER JOIN SERVE PARA TRAZER MAIS INFORMAÇÕES DE UMA TABELA, ATRAVES DE PONTOS QUE LIGAM AS DUAS, COMO POR EXEMPLO ID DE UMA E CATEGORIAID DA OUTRA 

FILTRO
WHERE P.PRECO < 10 OR                            > SÓ VAI TRAZER OS RESULTADOS QUE CABEM NA INFORMAÇÃO, COMO POR EXEMPLO SÓ VAI TRAZER OS PRODUTOS COM PREÇOS MENORES QUE 10 REAIS
WHERE P.QTESTOQUE > 10                           > SÓ VAI TRAZER OS PRODUTOS QUE TEM MAIS DE 10 NO ESTOQUE

AND -> CONECTIVO LOGICO "e"
OR -> CONECTIVO LOGICO "ou"