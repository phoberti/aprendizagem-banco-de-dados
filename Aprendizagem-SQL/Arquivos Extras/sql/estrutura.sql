CREATE TABLE pais (
    idpais SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    sigla VARCHAR(10)
);

CREATE TABLE estado (
    idestado SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    sigla VARCHAR(10),
    idpais INTEGER REFERENCES pais(idpais)
);

CREATE TABLE cidade (
    idcidade SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    inscricaoestadual INTEGER,
    idestado INTEGER REFERENCES estado(idestado)
);
CREATE TABLE usuario (
    idusuario SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE parceiro (
    idparceiro SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    nomefantasia VARCHAR(100),
    documento VARCHAR(20)
);

CREATE TABLE endereco (
    idendereco SERIAL PRIMARY KEY,
    logradouro VARCHAR(150),
    numero VARCHAR(20),
    cep VARCHAR(20),
    complemento VARCHAR(50),
    idcidade INTEGER REFERENCES cidade(idcidade),
    idusuario INTEGER REFERENCES usuario(idusuario),
    idparceiro INTEGER REFERENCES parceiro(idparceiro)
);

CREATE TABLE telefone (
    idtelefone SERIAL PRIMARY KEY,
    numero VARCHAR(20),
    idusuario INTEGER REFERENCES usuario(idusuario),
    idparceiro INTEGER REFERENCES parceiro(idparceiro)
);

CREATE TABLE produto (
    idproduto SERIAL PRIMARY KEY,
    codigo VARCHAR(20),
    nome VARCHAR(100),
    peso NUMERIC(10,2)
);

CREATE TABLE tabelapreco (
    idtabelapreco SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    idnativo INTEGER
);

CREATE TABLE condicaopagamento (
    idcondicaopagamento SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE pedido (
    idpedido SERIAL PRIMARY KEY,
    datapedido DATE,
    valortotal NUMERIC(10,2),
    quantidadeprodutos INTEGER,
    idusuario INTEGER REFERENCES usuario(idusuario),
    idparceiro INTEGER REFERENCES parceiro(idparceiro),
    idtabelapreco INTEGER REFERENCES tabelapreco(idtabelapreco),
    idcondicaopagamento INTEGER REFERENCES condicaopagamento(idcondicaopagamento)
);

CREATE TABLE pedidoproduto (
    idpedidoproduto SERIAL PRIMARY KEY,
    idpedido INTEGER REFERENCES pedido(idpedido),
    idproduto INTEGER REFERENCES produto(idproduto),
    valorvenda NUMERIC(10,2)
);

CREATE TABLE tabelaprecoproduto (
    idtabelaprecoproduto SERIAL PRIMARY KEY,
    idtabelapreco INTEGER REFERENCES tabelapreco(idtabelapreco),
    idproduto INTEGER REFERENCES produto(idproduto),
    preco NUMERIC(10,2)
);
