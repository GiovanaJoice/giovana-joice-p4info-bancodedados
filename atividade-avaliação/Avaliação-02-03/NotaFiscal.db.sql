BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "TB_PRODUTOS" (
	"COD_PRO"	INTEGER NOT NULL UNIQUE,
	"NOME_PROD"	TEXT NOT NULL,
	"PRECO_UNIT"	NUMERIC NOT NULL,
	PRIMARY KEY("COD_PRO")
);
CREATE TABLE IF NOT EXISTS "TB_CLIENTES" (
	"ID"	INTEGER NOT NULL,
	"END_CLI"	TEXT NOT NULL,
	"NOME_CLI"	TEXT NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "TB_VENDEDORES" (
	"ID"	INTEGER NOT NULL,
	"NOME_VEND"	TEXT NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "TB_NOTAS_FISCAIS" (
	"COD_CLI"	INTEGER,
	"COD_VEND"	INTEGER,
	"NUM_NF"	INTEGER NOT NULL UNIQUE,
	"SERIE_NF"	TEXT NOT NULL,
	FOREIGN KEY("COD_CLI") REFERENCES "TB_CLIENTES"("ID"),
	PRIMARY KEY("NUM_NF")
);
CREATE TABLE IF NOT EXISTS "TB_ITENS_NOTAFISCAL" (
	"NUM_NF"	INTEGER,
	"COD_PROD"	INTEGER,
	"QNTD"	INTEGER NOT NULL,
	FOREIGN KEY("COD_PROD") REFERENCES "TB_PRODUTOS"("COD_PRO"),
	FOREIGN KEY("NUM_NF") REFERENCES "TB_NOTAS_FISCAIS"("NUM_NF"),
	PRIMARY KEY("NUM_NF","COD_PROD")
);
INSERT INTO "TB_PRODUTOS" ("COD_PRO","NOME_PROD","PRECO_UNIT") VALUES (100,'Arroz Tio João ',6),
 (150,'Feijão Carioquinha',5.5),
 (200,'Macarrão Fortaleza',3.5),
 (250,'Oleo de Soja',4),
 (300,'Manteiga Betania 500g',8),
 (350,'Queijo Ricota Betania',7);
INSERT INTO "TB_CLIENTES" ("ID","END_CLI","NOME_CLI") VALUES (1,'José Maria Alves','Av João Pessoa 2081'),
 (2,'Maria Conceição Tavares','Rua Waldery Uchoa 4'),
 (3,'João Cosme Fonseca','Rua Padre Franscisco Pinto 790'),
 (4,'Tiago Cosme Fonseca','Rua Padre Franscisco Pinto 790');
INSERT INTO "TB_VENDEDORES" ("ID","NOME_VEND") VALUES (1,'Luciano Arruda Cavalcante'),
 (2,'Joana Alves Pessoa'),
 (3,'Mercia Bessa Santos'),
 (4,'Antonio de Padua Lopes');
INSERT INTO "TB_NOTAS_FISCAIS" ("COD_CLI","COD_VEND","NUM_NF","SERIE_NF") VALUES (1,1,100,'A'),
 (3,2,101,'A'),
 (2,3,102,'A'),
 (4,4,103,'A'),
 (2,1,104,'A'),
 (1,3,105,'A'),
 (3,2,106,'A'),
 (4,4,107,'A');
INSERT INTO "TB_ITENS_NOTAFISCAL" ("NUM_NF","COD_PROD","QNTD") VALUES (100,100,5),
 (100,150,4),
 (100,200,4),
 (101,250,8),
 (101,300,4),
 (102,100,6),
 (102,250,8),
 (103,300,4),
 (103,350,4),
 (104,150,10),
 (104,100,12),
 (106,150,10),
 (106,200,10),
 (107,100,10),
 (107,150,10),
 (107,200,10);
COMMIT;
