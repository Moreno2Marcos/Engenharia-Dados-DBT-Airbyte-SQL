-- Configura o modelo de transações para ser materializado como uma "table" no banco de dados

{{ config(materialized='table') }}

WITH transacoes_base AS (
    SELECT *
    FROM tb_transacoes
)

SELECT
    transacao_id,
    cliente_id,
    conta_id,
    tipo_transacao,
    valor,
    data_transacao
FROM transacoes_base