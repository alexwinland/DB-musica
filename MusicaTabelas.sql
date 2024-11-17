CREATE TABLE GRAVADORA (
       Codigo_Gravadora     INTEGER NOT NULL,
       Nome_Gravadora       CHAR(60) NULL,
       Endereco             CHAR(60) NULL,
       Telefone             CHAR(20) NULL,
       Contato              CHAR(20) NULL,
       URL                  CHAR(80) NULL
);
ALTER TABLE GRAVADORA
       ADD  CONSTRAINT XPKGRAVADORA PRIMARY KEY (Codigo_Gravadora);

CREATE TABLE CD (
       Codigo_CD            INTEGER NOT NULL,
       Codigo_Gravadora     INTEGER NULL,
       Nome_CD              CHAR(60) NULL,
       Preco_Venda          NUMERIC(14,2) NULL,
       Data_Lancamento      DATE NULL,
       CD_Indicado          INTEGER NULL
);

ALTER TABLE CD ADD  CONSTRAINT XPKCD PRIMARY KEY (Codigo_CD) ;

alter table cd add estilo CHAR(20);

alter table cd add vendas NUMERIC(8,2);

CREATE TABLE MUSICA (
       Codigo_Musica        INTEGER NOT NULL,
       Nome_Musica          CHAR(60) NULL,
       Duracao              NUMERIC(6,2) NULL
);

ALTER TABLE MUSICA
       ADD  CONSTRAINT XPKMUSICA PRIMARY KEY (Codigo_Musica);

CREATE TABLE AUTOR (
       Codigo_Autor         INTEGER NOT NULL,
       Nome_Autor           CHAR(60) NULL
);

ALTER TABLE AUTOR
       ADD  CONSTRAINT XPKAUTOR PRIMARY KEY (Codigo_Autor) ;



CREATE TABLE MUSICA_AUTOR (
       Codigo_Musica        INTEGER NOT NULL,
       Codigo_Autor         INTEGER NOT NULL
);

ALTER TABLE MUSICA_AUTOR
       ADD  CONSTRAINT XPKMUSICA_AUTOR PRIMARY KEY (Codigo_Musica, Codigo_Autor) ;



CREATE TABLE FAIXA (
       Codigo_Musica        INTEGER NOT NULL,
       Codigo_CD            INTEGER NOT NULL,
       Numero_Faixa         INTEGER NULL
);

ALTER TABLE FAIXA ADD  CONSTRAINT XPKFAIXA PRIMARY KEY (Codigo_Musica, Codigo_CD);

CREATE TABLE CD_CATEGORIA(
       Codigo_Categoria   INTEGER    NOT NULL,
       Menor_Preco        NUMERIC(14,2) NOT NULL,
       Maior_Preco        NUMERIC(14,2) NOT NULL
);

ALTER TABLE CD
       ADD  CONSTRAINT GRAVADORA_CD  FOREIGN KEY (Codigo_Gravadora) REFERENCES GRAVADORA;

ALTER TABLE CD
       ADD  CONSTRAINT CD_CD FOREIGN KEY (CD_Indicado) REFERENCES CD ;

ALTER TABLE MUSICA_AUTOR
       ADD  CONSTRAINT AUTOR_MUSICA_AUTOR FOREIGN KEY (Codigo_Autor) REFERENCES AUTOR ;


ALTER TABLE MUSICA_AUTOR
       ADD  CONSTRAINT MUSICA_MUSICA_AUTOR FOREIGN KEY (Codigo_Musica) REFERENCES MUSICA ;


ALTER TABLE FAIXA
       ADD  CONSTRAINT CD_FAIXA FOREIGN KEY (Codigo_CD) REFERENCES CD ;


ALTER TABLE FAIXA
       ADD  CONSTRAINT MUSICA_FAIXA FOREIGN KEY (Codigo_Musica) REFERENCES MUSICA ;