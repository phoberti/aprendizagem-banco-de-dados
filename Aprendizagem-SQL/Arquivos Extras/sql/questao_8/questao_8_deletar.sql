CREATE OR REPLACE PROCEDURE sp_deletar_produto_por_codigo(
    p_codigo VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_idproduto INTEGER;
BEGIN
    SELECT idproduto
    INTO v_idproduto
    FROM produto
    WHERE codigo = p_codigo;

    IF v_idproduto IS NULL THEN
        RAISE EXCEPTION 'Nenhum produto encontrado com o código: %', p_codigo;
    END IF;

   
    DELETE FROM pedidoproduto
    WHERE idproduto = v_idproduto;

    DELETE FROM tabelaprecoproduto
    WHERE idproduto = v_idproduto;


    DELETE FROM produto
    WHERE idproduto = v_idproduto;
END;
$$;
