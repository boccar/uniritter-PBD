CREATE OR REPLACE FUNCTION cli_host_por_quarto(BIGINT) RETURNS SETOF clientes AS
$$
    SELECT * FROM clientes WHERE id IN (
    SELECT clientes.id FROM clientes,hospedagens
    WHERE clientes.id = hospedagens.id
    AND hospedagens.id_reserva = $1
    )
$$
LANGUAGE SQL;

SELECT cli_host_por_quarto(2);