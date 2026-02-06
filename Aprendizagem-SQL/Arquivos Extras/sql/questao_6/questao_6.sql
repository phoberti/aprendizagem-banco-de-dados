CREATE VIEW vw_relatorio_produto AS
SELECT
    prod.nome        AS nome_produto,
    par.documento    AS documento_parceiro,
    est.sigla        AS sigla_estado,
    tp.idtabelapreco AS codigo_tabela_preco,
    endu.cep         AS cep_usuario,
    tpp.preco        AS preco_produto,
    u.email          AS email_usuario
FROM pedido ped
JOIN usuario u ON u.idusuario = ped.idusuario
JOIN parceiro par ON par.idparceiro = ped.idparceiro
JOIN endereco endu ON endu.idusuario = u.idusuario
JOIN cidade cid ON cid.idcidade = endu.idcidade
JOIN estado est ON est.idestado = cid.idestado
JOIN tabelapreco tp ON tp.idtabelapreco = ped.idtabelapreco
JOIN tabelaprecoproduto tpp ON tpp.idtabelapreco = tp.idtabelapreco
JOIN produto prod ON prod.idproduto = tpp.idproduto;
