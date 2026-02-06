CREATE TABLE transportadora (
    idtransportadora SERIAL PRIMARY KEY,
    nome VARCHAR(150),
    cnpj VARCHAR(25)
);

CREATE TABLE notafiscal (
    idnotafiscal SERIAL PRIMARY KEY,
    numero_nf VARCHAR(20),
    chave_acesso VARCHAR(60),
    data_emissao DATE,
    valor_total NUMERIC(10,2),
    valor_icms NUMERIC(10,2),
    base_icms NUMERIC(10,2),
    valor_pis NUMERIC(10,2),
    valor_cofins NUMERIC(10,2),

    idpedido INTEGER REFERENCES pedido(idpedido),
    idparceiro INTEGER REFERENCES parceiro(idparceiro),
    idendereco INTEGER REFERENCES endereco(idendereco),
    idtransportadora INTEGER REFERENCES transportadora(idtransportadora)
);
