CREATE OR REPLACE FUNCTION calcular_imc(
    p_peso NUMERIC,
    p_altura NUMERIC
)
RETURNS NUMERIC AS $$
DECLARE
    v_imc NUMERIC;
BEGIN
    v_imc := p_peso / (p_altura * p_altura);
    RETURN ROUND(v_imc, 2);
END;
$$ LANGUAGE plpgsql;
