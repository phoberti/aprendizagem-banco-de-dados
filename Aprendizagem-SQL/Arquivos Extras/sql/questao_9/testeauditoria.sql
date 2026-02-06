DROP TABLE IF EXISTS _audit_test_marker;

CREATE TEMP TABLE _audit_test_marker (
    started_at TIMESTAMP NOT NULL,
    idpedido_criado INTEGER NOT NULL
) ON COMMIT PRESERVE ROWS;

DO $$
DECLARE
    v_idpedido INTEGER;
BEGIN
    INSERT INTO pedido
        (datapedido, valortotal, quantidadeprodutos, idusuario, idparceiro, idtabelapreco, idcondicaopagamento)
    VALUES
        (CURRENT_DATE, 149.90, 1, 1000, 2000, 6000, 7000)
    RETURNING idpedido INTO v_idpedido;

    INSERT INTO _audit_test_marker (started_at, idpedido_criado)
    VALUES (NOW(), v_idpedido);

    UPDATE pedido
    SET valortotal = valortotal + 20,
        quantidadeprodutos = quantidadeprodutos + 1
    WHERE idpedido = v_idpedido;

    INSERT INTO pedidoproduto (idpedido, idproduto, valorvenda)
    VALUES (v_idpedido, 5002, 79.90);


    DELETE FROM pedidoproduto
    WHERE idpedido = v_idpedido;

    DELETE FROM pedido
    WHERE idpedido = v_idpedido;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM _audit_test_marker;

SELECT
    idpedido_audit,
    valortotal_atual, valortotal_old,
    quantidadeprodutos_atual, quantidadeprodutos_old,
    ultima_atualizacao,
    ultima_operacao
FROM pedido_audit
WHERE ultima_atualizacao >= (SELECT started_at FROM _audit_test_marker LIMIT 1)
ORDER BY idpedido_audit;
