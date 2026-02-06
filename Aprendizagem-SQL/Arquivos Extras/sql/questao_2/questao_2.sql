SELECT
    p.nomefantasia,
    c.nome AS cidade,
    e.nome AS estado,
    e.sigla AS sigla_estado,
    pa.nome AS pais,
    pa.sigla AS sigla_pais
FROM parceiro p
JOIN endereco en ON en.idparceiro = p.idparceiro
JOIN cidade c ON c.idcidade = en.idcidade
JOIN estado e ON e.idestado = c.idestado
JOIN pais pa ON pa.idpais = e.idpais
ORDER BY p.idparceiro;
