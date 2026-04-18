{{ config(materialized='incremental', unique_key='data') }}

WITH base AS (

    SELECT
        date(data_transacao) AS data,
        id_transacao,
        id_cliente,
        natureza_movimentacao,
        valor
    FROM {{ ref('int_transacoes_enriquecidas') }}

    {% if is_incremental() %}
        -- Reprocessa a última data carregada para permitir atualização da chave única.
        WHERE date(data_transacao) >= (SELECT MAX(data) FROM {{ this }})
    {% endif %}

)

SELECT
    CAST(data AS TEXT) AS data,
    CAST(COUNT(DISTINCT id_transacao) AS INTEGER) AS qtd_transacoes,
    CAST(COUNT(DISTINCT id_cliente) AS INTEGER) AS qtd_clientes_unicos,
    CAST(SUM(CASE WHEN natureza_movimentacao = 'entrada' THEN valor ELSE 0 END) AS NUMERIC) AS total_entradas,
    CAST(SUM(CASE WHEN natureza_movimentacao = 'saida' THEN valor ELSE 0 END) AS NUMERIC) AS total_saidas,
    CAST(
        SUM(CASE WHEN natureza_movimentacao = 'entrada' THEN valor ELSE 0 END)
        - SUM(CASE WHEN natureza_movimentacao = 'saida' THEN valor ELSE 0 END)
        AS NUMERIC
    ) AS saldo_liquido 
FROM base
GROUP BY data