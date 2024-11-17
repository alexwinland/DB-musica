# Sistema de Cadastro de CDs, Músicas, Autores e Gravadoras

Este repositório contém um conjunto de scripts SQL para a criação de um banco de dados de música, com tabelas para armazenar informações sobre CDs, faixas, músicas, autores e gravadoras. Abaixo, explicamos como cada tabela e suas funcionalidades são organizadas.

## Estrutura do Banco de Dados

### 1. **Tabela: GRAVADORA**

- **Descrição**: Armazena informações sobre as gravadoras de música.
- **Campos**:
  - `Codigo_Gravadora`: Código único da gravadora (chave primária).
  - `Nome_Gravadora`: Nome da gravadora.
  - `Endereco`: Endereço da gravadora.
  - `Telefone`: Número de telefone da gravadora.
  - `Contato`: Nome de contato na gravadora.
  - `URL`: URL do site da gravadora.

- **Relacionamento**: Cada CD registrado na tabela `CD` está associado a uma gravadora.

### 2. **Tabela: CD**

- **Descrição**: Armazena informações sobre os CDs, como nome, preço e data de lançamento.
- **Campos**:
  - `Codigo_CD`: Código único do CD (chave primária).
  - `Codigo_Gravadora`: Referência à gravadora do CD (chave estrangeira para a tabela `GRAVADORA`).
  - `Nome_CD`: Nome do CD.
  - `Preco_Venda`: Preço de venda do CD.
  - `Data_Lancamento`: Data de lançamento do CD.
  - `CD_Indicado`: Código de um CD indicado (auto-referência, chave estrangeira para a própria tabela `CD`).
  - `Estilo`: Estilo musical do CD.
  - `Vendas`: Número de unidades vendidas.

- **Relacionamento**: 
  - A tabela `CD` possui um relacionamento com a tabela `GRAVADORA` e com ela mesma (auto-referência) através dos campos `Codigo_Gravadora` e `CD_Indicado`.

### 3. **Tabela: MUSICA**

- **Descrição**: Armazena informações sobre as músicas.
- **Campos**:
  - `Codigo_Musica`: Código único da música (chave primária).
  - `Nome_Musica`: Nome da música.
  - `Duracao`: Duração da música em minutos.

### 4. **Tabela: AUTOR**

- **Descrição**: Armazena informações sobre os autores das músicas.
- **Campos**:
  - `Codigo_Autor`: Código único do autor (chave primária).
  - `Nome_Autor`: Nome do autor.

### 5. **Tabela: MUSICA_AUTOR**

- **Descrição**: Relaciona músicas aos seus respectivos autores, permitindo que uma música tenha múltiplos autores.
- **Campos**:
  - `Codigo_Musica`: Código da música (chave estrangeira para a tabela `MUSICA`).
  - `Codigo_Autor`: Código do autor (chave estrangeira para a tabela `AUTOR`).

### 6. **Tabela: FAIXA**

- **Descrição**: Relaciona as músicas aos CDs, organizando as faixas dentro dos CDs.
- **Campos**:
  - `Codigo_Musica`: Código da música (chave estrangeira para a tabela `MUSICA`).
  - `Codigo_CD`: Código do CD (chave estrangeira para a tabela `CD`).
  - `Numero_Faixa`: Número da faixa no CD (indica a ordem da música no CD).

### 7. **Tabela: CD_CATEGORIA**

- **Descrição**: Armazena categorias de CDs com base no preço de venda.
- **Campos**:
  - `Codigo_Categoria`: Código único da categoria.
  - `Menor_Preco`: Preço mínimo do CD na categoria.
  - `Maior_Preco`: Preço máximo do CD na categoria.

### 8. **Relacionamentos e Restrições**

- **Relacional**:
  - A tabela `CD` é vinculada à `GRAVADORA` através de uma chave estrangeira.
  - A tabela `CD` também possui um relacionamento consigo mesma, permitindo indicar outros CDs relacionados.
  - A tabela `MUSICA_AUTOR` cria uma relação muitos-para-muitos entre músicas e autores.
  - A tabela `FAIXA` estabelece a ordem das faixas em CDs, relacionando músicas com seus CDs respectivos.

### 9. **Exemplos de Inserção de Dados**

Os seguintes exemplos mostram como inserir dados nas tabelas do banco:

#### Inserção de Autores

```sql
INSERT INTO AUTOR (CODIGO_AUTOR, NOME_AUTOR) VALUES (1, 'Renato Russo');
INSERT INTO AUTOR (CODIGO_AUTOR, NOME_AUTOR) VALUES (2, 'Tom Jobim');
INSERT INTO AUTOR (CODIGO_AUTOR, NOME_AUTOR) VALUES (3, 'Chico Buarque');
INSERT INTO AUTOR (CODIGO_AUTOR, NOME_AUTOR) VALUES (4, 'Dado Villa-Lobos');
```

#### Inserção de Músicas

```sql
INSERT INTO MUSICA (CODIGO_MUSICA, NOME_MUSICA, DURACAO) VALUES (1, 'Será', 2.28);
INSERT INTO MUSICA (CODIGO_MUSICA, NOME_MUSICA, DURACAO) VALUES (2, 'Ainda é Cedo', 3.55);
INSERT INTO MUSICA (CODIGO_MUSICA, NOME_MUSICA, DURACAO) VALUES (3, 'Geração Coca-Cola', 2.20);
INSERT INTO MUSICA (CODIGO_MUSICA, NOME_MUSICA, DURACAO) VALUES (4, 'Eduardo e Monica', 4.32);
```

#### Inserção de Gravadoras

```sql
INSERT INTO GRAVADORA (CODIGO_GRAVADORA, NOME_GRAVADORA, ENDERECO, URL, CONTATO) 
VALUES (1, 'EMI', 'Rod. Pres. Dutra, s/n – km 229,8', 'www.emi-music.com.br', 'JOÃO');
INSERT INTO GRAVADORA (CODIGO_GRAVADORA, NOME_GRAVADORA, ENDERECO, URL, CONTATO) 
VALUES (2, 'BMG', 'Av. Piramboia, 2898 - Parte 7', 'www.bmg.com.br', 'MARIA');
```

#### Inserção de CDs

```sql
INSERT INTO CD (CODIGO_CD, CODIGO_GRAVADORA, NOME_CD, PRECO_VENDA, DATA_LANCAMENTO) 
VALUES (1, 1, 'Mais do Mesmo', 15.00, to_date('01/10/1998','dd/mm/yyyy'));
INSERT INTO CD (CODIGO_CD, CODIGO_GRAVADORA, NOME_CD, PRECO_VENDA, DATA_LANCAMENTO) 
VALUES (2, 2, 'Bate-Boca', 12.00, to_date('01/07/1999','dd/mm/yyyy'));
```

#### Inserção de Faixas

```sql
INSERT INTO FAIXA (CODIGO_CD, NUMERO_FAIXA, CODIGO_MUSICA) VALUES (1, 1, 1);
INSERT INTO FAIXA (CODIGO_CD, NUMERO_FAIXA, CODIGO_MUSICA) VALUES (1, 2, 2);
INSERT INTO FAIXA (CODIGO_CD, NUMERO_FAIXA, CODIGO_MUSICA) VALUES (1, 3, 3);
```

## Funcionalidades

O sistema permite realizar as seguintes operações:

- **Cadastro de Gravadoras**: É possível adicionar, editar e consultar as informações de gravadoras.
- **Cadastro de CDs**: Os CDs podem ser registrados com detalhes como nome, preço de venda, data de lançamento e gravadora associada.
- **Cadastro de Músicas e Autores**: As músicas são cadastradas com informações como nome e duração, enquanto os autores podem ser associados às músicas.
- **Relacionamento entre CD e Faixas**: As faixas de um CD são associadas por número de faixa, permitindo a organização do conteúdo.
- **Categorias de Preço para CDs**: É possível classificar CDs em categorias baseadas no preço de venda.

## Considerações Finais

Este banco de dados pode ser usado para organizar, catalogar e pesquisar informações sobre CDs, músicas, autores e gravadoras. A estrutura foi projetada para garantir integridade referencial, permitindo a associação correta entre as entidades.
