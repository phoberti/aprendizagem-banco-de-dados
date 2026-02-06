SELECT
    ped.idpedido AS numero_pedido,
    ped.datapedido,
    ped.valortotal,
    ped.quantidadeprodutos,

    par.nome AS nome_parceiro,
    par.nomefantasia,

    u.nome AS nome_usuario,
    u.email,

    tp.nome AS tabela_preco,
    cp.nome AS condicao_pagamento,

    prod.nome AS nome_produto,
    prod.codigo AS codigo_produto,
    pp.valorvenda,

    pa.nome AS pais,
    est.sigla AS sigla_estado,

    tel.numero AS telefone_parceiro

FROM pedido ped

JOIN parceiro par ON par.idparceiro = ped.idparceiro
JOIN usuario u ON u.idusuario = ped.idusuario
JOIN tabelapreco tp ON tp.idtabelapreco = ped.idtabelapreco
JOIN condicaopagamento cp ON cp.idcondicaopagamento = ped.idcondicaopagamento

JOIN pedidoproduto pp ON pp.idpedido = ped.idpedido
JOIN produto prod ON prod.idproduto = pp.idproduto

JOIN endereco endp ON endp.idparceiro = par.idparceiro
JOIN cidade cid ON cid.idcidade = endp.idcidade
JOIN estado est ON est.idestado = cid.idestado
JOIN pais pa ON pa.idpais = est.idpais

LEFT JOIN telefone tel ON tel.idparceiro = par.idparceiro

ORDER BY ped.idpedido;
