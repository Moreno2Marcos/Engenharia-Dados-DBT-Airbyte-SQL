{{ config(materialized='view') }}  -- Configura o modelo para ser materializado como uma view no banco de dados

WITH transacoes_base AS (
    SELECT *
    FROM tb_transacoes
    WHERE valor < 500
)

SELECT
    transacao_id,
    cliente_id,
    data_transacao,
    tipo_transacao,
    valor,
    status_transacao
FROM transacoes_base