CREATE OR REPLACE FUNCTION fn_auditoria_pedido()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO pedido_audit (
            idusuario_atual, idparceiro_atual, idtabelapreco_atual, idcondicaopagamento_atual,
            valortotal_atual, quantidadeprodutos_atual,
            ultima_atualizacao, ultima_operacao
        )
        VALUES (
            NEW.idusuario, NEW.idparceiro, NEW.idtabelapreco, NEW.idcondicaopagamento,
            NEW.valortotal, NEW.quantidadeprodutos,
            NOW(), 'Insert'
        );
        RETURN NEW;

    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO pedido_audit (
            idusuario_atual, idparceiro_atual, idtabelapreco_atual, idcondicaopagamento_atual,
            valortotal_atual, quantidadeprodutos_atual,
            idusuario_old, idparceiro_old, idtabelapreco_old, idcondicaopagamento_old,
            valortotal_old, quantidadeprodutos_old,
            ultima_atualizacao, ultima_operacao
        )
        VALUES (
            NEW.idusuario, NEW.idparceiro, NEW.idtabelapreco, NEW.idcondicaopagamento,
            NEW.valortotal, NEW.quantidadeprodutos,
            OLD.idusuario, OLD.idparceiro, OLD.idtabelapreco, OLD.idcondicaopagamento,
            OLD.valortotal, OLD.quantidadeprodutos,
            NOW(), 'Atualizado'
        );
        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO pedido_audit (
            idusuario_old, idparceiro_old, idtabelapreco_old, idcondicaopagamento_old,
            valortotal_old, quantidadeprodutos_old,
            ultima_atualizacao, ultima_operacao
        )
        VALUES (
            OLD.idusuario, OLD.idparceiro, OLD.idtabelapreco, OLD.idcondicaopagamento,
            OLD.valortotal, OLD.quantidadeprodutos,
            NOW(), 'Deletado'
        );
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;
