SELECT
    c.cliente_id,
    c.nome,
    c.estado,
    {{ calcular_media_transacoes('t.valor') }} AS media_transacoes
FROM {{ ref('clientes') }} c
JOIN {{ ref('transacoes') }} t
    ON c.cliente_id = t.cliente_id
WHERE c.estado IN ('SP', 'RJ')
GROUP BY
    c.cliente_id,
    c.nome,
    c.estado