CREATE OR REPLACE FUNCTION fn_validar_pedido()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.valortotal < 1 THEN
        RAISE EXCEPTION 'Valor total não pode ser menor que 1';
    END IF;

    IF NEW.quantidadeprodutos < 0 THEN
        RAISE EXCEPTION 'Quantidade de produtos não pode ser negativa';
    END IF;

    IF NEW.datapedido < CURRENT_DATE THEN
        RAISE EXCEPTION 'Data do pedido não pode ser menor que a data atual';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
