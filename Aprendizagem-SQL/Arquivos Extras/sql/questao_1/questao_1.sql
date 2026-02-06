SELECT
    u.nome AS nome_usuario,
    u.email,
    e.logradouro,
    e.numero,
    e.cep,
    e.complemento,
    t.numero AS telefone
FROM usuario u
LEFT JOIN endereco e ON e.idusuario = u.idusuario
LEFT JOIN telefone t ON t.idusuario = u.idusuario
ORDER BY u.idusuario;
