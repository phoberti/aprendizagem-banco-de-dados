CREATE TRIGGER trg_validar_pedido
BEFORE INSERT OR UPDATE ON pedido
FOR EACH ROW
EXECUTE FUNCTION fn_validar_pedido();
