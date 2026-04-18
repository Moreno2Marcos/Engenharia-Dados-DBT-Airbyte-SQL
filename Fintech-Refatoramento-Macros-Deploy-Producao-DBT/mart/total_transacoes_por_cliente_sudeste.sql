SELECT
    c.cliente_id,
    c.nome,
    c.estado,
    {{ calcular_total_transacoes('t.valor') }} AS total_transacoes
FROM {{ ref('clientes_sudeste') }} c
JOIN {{ ref('transacoes') }} t
    ON c.cliente_id = t.cliente_id
GROUP BY
    c.cliente_id,
    c.nome,
    c.estado