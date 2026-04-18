{{ config(materialized='view') }}

SELECT
    c.id_cliente,
    c.nome,
    c.email,
    c.criado_em AS cliente_criado_em,
    ct.id_conta,
    ct.tipo_conta,
    ct.saldo AS saldo_atual,
    ct.criada_em AS conta_criada_em
FROM clientes c
INNER JOIN contas ct
    ON c.id_cliente = ct.id_cliente