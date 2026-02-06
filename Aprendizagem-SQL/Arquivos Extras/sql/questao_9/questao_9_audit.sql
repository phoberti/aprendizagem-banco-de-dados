CREATE TABLE pedido_audit (
    idpedido_audit SERIAL PRIMARY KEY,

    -- campos atuais
    idusuario_atual INTEGER,
    idparceiro_atual INTEGER,
    idtabelapreco_atual INTEGER,
    idcondicaopagamento_atual INTEGER,
    valortotal_atual NUMERIC(10,2),
    quantidadeprodutos_atual INTEGER,

    -- campos antigos
    idusuario_old INTEGER,
    idparceiro_old INTEGER,
    idtabelapreco_old INTEGER,
    idcondicaopagamento_old INTEGER,
    valortotal_old NUMERIC(10,2),
    quantidadeprodutos_old INTEGER,

    ultima_atualizacao TIMESTAMP,
    ultima_operacao VARCHAR(20)
);
