CREATE OR REPLACE PROCEDURE sp_atualizar_nome_produto(
    p_codigo VARCHAR,
    p_novo_nome VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE produto
    SET nome = p_novo_nome
    WHERE codigo = p_codigo;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Nenhum produto encontrado com o código: %', p_codigo;
    END IF;
END;
$$;
