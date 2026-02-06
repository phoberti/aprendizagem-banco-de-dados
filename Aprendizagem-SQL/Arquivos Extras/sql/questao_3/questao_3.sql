SELECT DISTINCT
    tp.idtabelapreco,
    tp.nome AS nome_tabela_preco
FROM tabelapreco tp
JOIN tabelaprecoproduto tpp ON tpp.idtabelapreco = tp.idtabelapreco
JOIN produto p ON p.idproduto = tpp.idproduto
JOIN pedido ped ON ped.idtabelapreco = tp.idtabelapreco
WHERE
    tp.idnativo = 0
    AND p.peso > 1.0
    AND ped.idparceiro = 2000;
